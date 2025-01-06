<?php

namespace App\Console\Commands;

use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\Console\Input\InputArgument;

class NewsCategoriesFetch extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'news:categories {url?} {news-root?}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Fetch categories from the news api, and save the categories list in json file.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    protected function getArguments()
    {
        return [
            ['url', InputArgument::REQUIRED, 'The URL to fetch the news categories from'],
            ['news-root', InputArgument::REQUIRED, 'The news website root'],
        ];
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $apiUrl = $this->argument('url') ? $this->argument('url') : env('NEWS_CATEGORY_API');
        $catRootUrl = $this->argument('news-root') ? $this->argument('news-root') : env('NEWS_WEB_ROOT');
        $filepath = "data/news_categories.json";

        if (!$apiUrl || !$catRootUrl) {
            $this->error("not enough arguments");
            return 1;
        }

        try {
            $context = stream_context_create([
                'http' => ['method' => 'GET', 'header' => "Accept: application/json\r\n", 'timeout' => 100]
            ]);
            $json = @file_get_contents($apiUrl, false, $context);
            if ($json === false) {
                $error = error_get_last();
                $this->error("Error fetching data: $error");
                return 1;
            }
            $data = json_decode($json, true);
            if (json_last_error() !== JSON_ERROR_NONE) {
                $this->error("Invalid json received from the endpoint");
                return 1;
            }
            $categories = array_map(function ($cat) use ($catRootUrl) {
                return [
                    'label' => $cat['menu_lavel'],
                    'url' => rtrim($catRootUrl, '/') . '/' . $cat['slug']
                ];
            }, $data['data']);
            Storage::put($filepath, json_encode($categories));
            $this->info("Data received and saved into storage/app/" . $filepath);
            return 1;
        } catch (Exception $e) {
            $this->error("Unexpected Error: " . $e->getMessage());
            return 1;
        }
    }
}
