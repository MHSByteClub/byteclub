//A list of taglines from which to choose when the page is loaded. 
const taglines=[
    "It doesn't have to make sense",
    "Number 0 in your arrays, number 1 in your hearts.",
    "Opposite Day has been cancelled.",
    "Blockchain, Cloud-based, Disruptor, Responsive",
    "['hip','hip']",
    "Yes, you should join.",
    "We invented lazy loading.",
    "We know computers.",
    "You thought it was bike club, didn't you?"
    ];

//A function that does the choosificating. 
function getTagline(){
    $("#tagline").html(taglines[Math.floor(Math.random()*taglines.length)]);
};