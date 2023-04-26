

describe('Products on Home Page', () => {
  beforeEach(() => {
    cy.visit("/", {auth: {
      username: 'Jungle',
      password: 'book',
    },})
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  })