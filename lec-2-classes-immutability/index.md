---
layout: default
objectives:
    - Understand immutability in objects and why it's useful.
    - Understand some of the negatives of immutability.
    - Understand logical equality vs. object identity
labs:
    - lab-2-chance

---

Equality or Identity
--------------------

Most modern languages have the concept of object *equality* build into them,
based on the object's reference.

One object reference is equal to another object reference if and only if they
occupy the same space in memory.

For many objects (e.g. `Money`, `Chance`, `Numbers`, etc) there is some
internal value concepts that should be used to determine equality.

$1 is always equal to $1, even if it is represented by two different objects in
memory. This is the object's *identity*.

e.g. (memory addresses made up)

`Chance<1/2>@2a2a2a2a` is not **equal** to `Chance<1/2>@1a1a1a1a`, however they
have the same **identity**.

**At this point, break to [lab 2](/lab-2-chance)**

Immutability
------------

Start by asking the class what immutability is? How many of them have ever
heard about immutability?

Ask them why they think we might want a class (or all classes) to be immutable?

* Simpler to understand
* Simpler to test
* Inherently thread-safe
* "Failure atomicity"; exceptions don't mean your object is in an unknown state
* Favor composition (which we'll touch on later)

What could we do when implementing a class to make it immutable?

* No mutators (setters or methods that change state)
* If there are mutable components (e.g. cached values), only the class can
    change them.
* Make all fields `private` and `final`
* Make the class `final`

What downsides might immutability have?

* Very rarely it might be a performance problem (more likely they can improve
    performance)
* Unnatural at first

