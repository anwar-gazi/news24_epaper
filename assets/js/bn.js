
const isNumeric = (str) => {
    if (typeof str !== 'string') {
        return false; // Only check strings
    }
    return !isNaN(str) && !isNaN(parseFloat(str));
};
window.bn = {
    char_map: {
        1: "১",
        2: "২",
        3: "৩",
        4: "৪",
        5: "৫",
        6: "৬",
        7: "৭",
        8: "৮",
        9: "৯",
        0: "০",
        "january": "জানুয়ারী",
        "february": "ফেব্রুয়ারী",
        "march": "মার্চ",
        "april": "এপ্রিল",
        "may": "মে",
        "june": "জুন",
        "july": "জুলাই",
        "august": "আগষ্ট",
        "september": "সেপ্টেম্বর",
        "october": "অক্টোবর",
        "november": "নভেম্বার",
        "december": "ডিসেম্বার",
        "su": "রবি",
        "mo": "সোম",
        "tu": "মঙ্গল",
        "we": "বুধ",
        "th": "বৃহ:",
        "fr": "শুক্র",
        "sa": "শনি",
    },
    date: function (date, in_format, out_format) {
        moment.locale('bn');
        return moment(date, in_format).format(out_format);
    },
    bn: function (char) {
        if (char.length > 1 && isNumeric(char)) {
            return char.split("").map((c) => this.char_map[c]);
        } else {
            return this.char_map[char];
        }
    }.bind(this),
};