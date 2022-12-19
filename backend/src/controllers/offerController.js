const offerModel = require("../models/offerModel");

const offerController = {
  getAllOffers: (_, res) => {
    offerModel
      .findAll()
      .then(([offers]) => res.status(200).send(offers))
      .catch((err) => console.error(err));
  },
  getOfferById: (req, res) => {
    const { id } = req.params;
    offerModel
      .findOne(id)
      .then(([offer]) => res.status(200).send(offer))
      .catch((err) => console.error(err));
  },
};

module.exports = offerController;
