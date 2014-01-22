---
layout: default
title: Mocking
type: misc
objectives:
    - Understand the benefits of VCS in general
    - Install and configure git
    - Gain basic understanding of the way git works to store and manipulate changes
    - Learn and be able to use at least basic git commands
    - Be able to revert changes in git in all the basic ways

---

###Section 1:

Ask if they have heard of mocking? Why is might be useful?

1. Working with old systems that one might have difficulty testing
2. Keeping tests of particular objects isolated to avoid breaking one object and causing the tests for 10 objects all to fail simultaneously
3. Test a service of which you don't know (or care about) the implementation details
4. Test a service which is not yet completed, but you know what the final response will be
5. Test database applications without having to spin up DB
5. Test around functionality that is untestable (i.e. Randomization or nearly random functionality)

I usually show the calculator example live to help explain the concept [(download calculator example tar here)]({{ site.baseurl }}/assets/files/calculator-mocking.tar) - this has several parts which are all separate git commits to try to make it easy for the trainer to review the material before doing it live.

Step 1: Show calculator app with failing test which tries to test the "multiply by random number" functionality (this stage is in the first commit in the above project)
  - Explain why the random function can't be tested well without some kind of mocking framework
  - Don't want to just leave these tests untested - even if it doesn't make sense to test the random functionality itself, it might still make sense to test other logic in the randomize method
  - Relate this to using a service of which you don't know the implementation details, or working with an service that is unfinished, but not wanting to hold up your testing efforts
Step 2: Implement Dependency Injection and create a manual stub to show the concept of mocking without a framework (this stage is on the second commit (commit hash: f3d9ddfed980a9f6e360013884cbb8a665795ae4))
  - Explain why dependency injection is needed, so we can pass in a fake "randomizer" that has an explicit return value set for the test
  - Other benefits of DI like plugability of diverse components (maybe DB example, plugging in a db manager for mysql, postgres, mongo, etc)
Step 3: Quick and easy mockito implementation to do the same thing the stub was doing
  - Explain how annoying it would be to have to write our own stub for every object we wanted to mock the return of. Would have class explosion very quickly.
  - We have a framework that can assist us in this...mockito!
  - Show how you can create a mock and inject it as a dependency, then just mock returns easily in one line, different for every method if you want
Step 4: Might be useful to add more logic, like doing something special if the number passed in is greater than ten, to show how verify can be used to assure a method was called
  - Mockito verify example

###Section 2:

####Example:
We used the warehouse order example from Martin Fowlers book [(download sample code here)]({{ site.baseurl }}/assets/files/warehouse-mocking.tar) - check the git repo included with this download to see the different stages of the example.

    public class OrderStateTester extends TestCase {
      private static String TALISKER = "Talisker";
      private static String HIGHLAND_PARK = "Highland Park";
      private Warehouse warehouse = new WarehouseImpl();

    protected void setUp() throws Exception {
      warehouse.add(TALISKER, 50);
      warehouse.add(HIGHLAND_PARK, 25);
    }

    public void testOrderIsFilledIfEnoughInWarehouse() {
      Order order = new Order(TALISKER, 50);
      order.fill(warehouse);
      assertTrue(order.isFilled());
      assertEquals(0, warehouse.getInventory(TALISKER));
    }

    public void testOrderDoesNotRemoveIfNotEnough() {
      Order order = new Order(TALISKER, 51);
      order.fill(warehouse);
      assertFalse(order.isFilled());
      assertEquals(50, warehouse.getInventory(TALISKER));
    }

1. Tend to want to focus on one element of the software at a time - (Order)
  - To make a single unit work, you often need other units (Warehouse)
2. This (above) style of testing uses state verification
  - i.e. We determine whether the exercised method worked correctly by examining the state of the SUT (subject under test) and its collaborators after the method was exercised.
4. Problem: If warehouse breaks, these order unit tests will also (misleadingly) break

A solution for this could be the following:

    public class OrderInteractionTester extends MockObjectTestCase {
      private static String TALISKER = "Talisker";

    public void testFillingRemovesInventoryIfInStock() {
      //setup - data
      Order order = new Order(TALISKER, 50);
      Mock warehouseMock = new Mock(Warehouse.class);    
      //setup - expectations
      warehouseMock.expects(once()).method("hasInventory")
        .with(eq(TALISKER),eq(50))
        .will(returnValue(true));
      warehouseMock.expects(once()).method("remove")
        .with(eq(TALISKER), eq(50))
        .after("hasInventory");
  
      //exercise
      order.fill((Warehouse) warehouseMock.proxy());    
      //verify
      warehouseMock.verify();
      assertTrue(order.isFilled());
    }

    public void testFillingDoesNotRemoveIfNotEnoughInStock() {
      Order order = new Order(TALISKER, 51);    
      Mock warehouse = mock(Warehouse.class);      
      warehouse.expects(once()).method("hasInventory")
        .withAnyArguments()
        .will(returnValue(false));
  
      order.fill((Warehouse) warehouse.proxy());
  
      assertFalse(order.isFilled());
    }

The above uses mock based testing instead of state verification, if one object breaks, it will not affect the other

After talking about the difference between these two types of testing techniques, depending on the level of their understanding, it might make sense for you to drive and change the state verification testing into mock based testing.

After you do this live on the projector, you can give them the original state verification warehouse sample, and allow them to try and change it in the same way in pairs.

It would make sense to come back every 20 or 30 minutes or so and show people's code on the project and check up on them and make sure everyone is progressing.

###Section 3:

Go over syntax for Mockito on [their website](http://docs.mockito.googlecode.com/hg/org/mockito/Mockito.html), teach about multiple returns, the various matchers used, etc. Going through the first several sections until you think you've covered most of the important stuff or they get bored.

###Section 4:

If there is time, you can let them do zen example [(download here)]({{ site.baseurl }}/assets/files/zen-mocking-example.tar) in pairs, then have them show their code afterwards.

This example asks them to mock a third party service which they know nothing about. Again, use the git repository to go back to the state where there are failing tests (it is random, so they will pass sometimes), and ask them to use mocks to make the tests pass consistently.
