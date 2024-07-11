String.prototype.interpolate = function (params) {
    const names = Object.keys(params);
    const vals = Object.values(params);
    return new Function(...names, `return \`${this}\`;`)(...vals);
}

function daysSince(s, singular, plural) {
    let n = new Date(Date.now());
    let d = new Date(s);
    let days = Math.floor(((n.valueOf() - d.valueOf()) / 1000) / (24 * 3600));
    var counter = "days";
    var years = 0;
    var months = 0;
    if (days > 31) {
        weeks = Math.floor(days / 7);
        counter = "weeks";
    }
    if (weeks > 6) {
        console.log(n)
        years = n.getFullYear() - d.getFullYear();
        months = 12 * years + (n.getMonth() - d.getMonth());
        if (months > 12) {
            counter = "years";
        } else {
            counter = "months";
        }
    }
    let template = (days === 1) ? singular[counter] : plural[counter];
    return template.interpolate({'days': days, 'months': months, 'years': years});
}

let singular = {
    "days": "${days} dag geleden",
    "months": "${months} maand geleden",
    "years": "${years} jaar geleden"
};
let plural = {
    "days": "${days} dagen geleden",
    "months": "${months} maanden geleden",
    "years": "${years} jaar geleden"
};


console.log(daysSince("2022-10-02", singular, plural))