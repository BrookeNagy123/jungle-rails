
describe('Product Page', () => {
  beforeEach(() => {
    cy.visit("/", {auth: {
      username: 'Jungle',
      password: 'book',
    },})
  });
  it("A user can click on a product to navigate to the product page", () => {
    cy.get(".products article").contains('Scented Blade').click()
    cy.get(".product-detail").should("be.visible");
  });
  })

 