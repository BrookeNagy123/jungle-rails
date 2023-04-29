
describe('Add to Cart', () => {
  beforeEach(() => {
    cy.visit("/", {auth: {
      username: 'Jungle',
      password: 'book',
    },})
  });
  it("A user can click on a product to add to their cart and the cart will increase by one", () => {
    cy.get(".products article").contains('Scented Blade').click()
    cy.get(".buy-btn").click({force: true})
    cy.get('.nav-item').contains("My Cart").should('contain', 'My Cart (1)')
  });
  });
