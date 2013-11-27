---
layout: default
title: JavaScript Intro
type: lecture

---

## Variables

<script>
var the_answer_to_life = 42;
the_answer_everywhere = 42;
</script>

{% highlight javascript %}
var the_answer_to_life = 42;
the_answer_everywhere = 42;
{% endhighlight %}

## Arrays

<script>
var people_i_like = ["lebo", "nyari", "james", "myself"];
</script>

{% highlight javascript %}
var people_i_like = ["lebo", "nyari", "james", "myself"];
{% endhighlight %}

## Objects

<script>
var mmathabo = {super_cool: true, name: "Mmathabo"};
</script>

{% highlight javascript %}
var mmathabo = {super_cool: true, name: "Mmathabo"};
{% endhighlight %}

## Functions

<script>
var fetchMeASandwich = function() {
    console.log("Do it yourself.");
};

function sudoFetchMeASandwich() {
    console.log("Ham or salami?");
}
</script>

{% highlight javascript %}
var fetchMeASandwich = function() {
    console.log("Do it yourself.");
};

function sudoFetchMeASandwich() {
    console.log("Ham or salami?");
}
{% endhighlight %}

## Function arguments

<script>
var makeSandwich = function(type) {
    if (type == "salami") {
        console.error("We're out of salami");
    } else {
        console.log("Making a delicious ham sandwich");
    }
}

var makeSandwichFrom = function() {
    var ingredients = arguments;

    for (i=0; i < arguments.length; i++) {
        console.log ("Adding " + ingredients[i] + " to the delicious sandwhich");
    }
}
</script>

{% highlight javascript %}
var makeSandwich = function(type) {
    if (type == "salami") {
        console.error("We're out of salami");
    } else {
        console.log("Making a delicious ham sandwich");
    }
}

var makeSandwichFrom = function() {
    var ingredients = arguments;

    for (i=0; i < arguments.length; i++) {
        console.log ("Adding " + ingredients[i] + " to the delicious sandwhich");
    }
}
{% endhighlight %}

## Classes

<script>
function Spaceship(name) {
    var self = this;

    self.name = name;

    self.hail = function(message) {
        console.log("This is the USS " + self.name + ", please identify.");
    };

    return self;
}

var enterprise = new Spaceship("Enterprise");
</script>

{% highlight javascript %}
function Spaceship(name) {
    var self = this;

    self.name = name;

    self.hail = function(message) {
        console.log("This is the USS " + self.name + ", please identify.");
    };

    return self;
}

var enterprise = new Spaceship("Enterprise");
{% endhighlight %}

## Identity or equality

<script>
var not_defined = undefined;
var another = null;

// not_defined == another
// not_defined === another

var pi = 3.14159;

// pi == "3.14159"
// pi === "3.14159
</script>

{% highlight javascript %}
var not_defined = undefined;
var another = null;

// not_defined == another
// not_defined === another

var pi = 3.14159;

// pi == "3.14159"
// pi === "3.14159
{% endhighlight %}

## Weak typing

<script>
var dude_bro_whoa = "hello there " + 100;
console.log(dude_bro_whoa);
</script>

{% highlight javascript %}
var dude_bro_whoa = "hello there " + 100;
console.log(dude_bro_whoa);
{% endhighlight %}

## Now... a project

Let's model a toll booth attendant. We'll use [Jasmine and
JSFiddle](http://jsfiddle.net/samfoo/q7zAa/).
