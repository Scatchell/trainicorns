---
layout: default
title: Lecture 3 - Relationships
type: lecture
objectives:
    - Understand the three relationships between objects and their order of
      preference
    - Understand the principle of using the fewest classes possible

---

## How Objects Interact

Ask the class what kinds of relationships objects can have with one another.

* Delegation - "has a..."
* Collaboration - "has and belongs to a..."
* Inheritance - "is a..."

Go into a deeper discussion of what each of these means:

## Delegation "Has a..."

A one-way relationship between objects, meaning: only one of the objects knows
about and works with the other.

e.g.

{% highlight java %}
class Spaceship {
    private final Engine engine;

    public Spaceship() {
        engine = new Engine();
    }

    // ... lots more code goes here
}
{% endhighlight %}

In the above example, a `Spaceship` *has an* `Engine`. `Engine`, however is
completely independant. Another class might also reference an `Engine` -- for
example, a `Car`, or a `Tractor` might also have an `Engine`.

## Collaboration "Has and belongs to..."

Both objects know about each other and work together.

When objects rely on one another in this fashion they are *coupled*,
refactoring one of the classes has a high likelihood of forcing a refactor of
the other. Because of this, it's best to try and keep the number of objects
that relate to one another as small as possible with very clear boundries where
the relationships end.

e.g.

{% highlight java %}
class World {
    private final Spaceship player;

    public World() {
        this.player = new Spaceship(this);
    }

    public void update(int dt) {
        this.player.draw();
    }

    // ... lots more code
}

class Spaceship {
    private final World world;

    public Spaceship(World world) {
        this.world = world;
    }

    public void draw() {
        this.world.drawTriangle(
            // whatever parameters a triangle needs...
        );
    }

    // ... lots more code
}
{% endhighlight %}

In the above example, both the `Spaceship` and the `World` know about, and
collaborate with one another. Other classes might also know about either one of
them, but no matter how a `Spaceship` or `World` is used, it must know about
the other.

## Inheritance "Is a..."

Ask the class when they think inheritance should inheritance be used?

## How Should We Prefer Them?

Ask the students to arrange the relationship types in the order in which they
should consider using them (i.e. "I think you should first consider...
then...").

1. Delegation
2. Collaboration
3. Inheritance

Why?

* Delegation is simplest and has the least amount of coupling.
* Collaboration is more complex and has more coupling.
* Inheritance is the tightest coupling of all, it's the hardest to change
    behavior since we can no longer use tools like dependency injection, and it's
    the least common situation that you might find yourself in.
