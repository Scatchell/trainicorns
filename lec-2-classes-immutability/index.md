---
layout: default
objectives:
    - Understand immutability in objects and why it's useful.
    - Understand some of the negatives of immutability.
labs:
    - lab-2-chance

---

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
