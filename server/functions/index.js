/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const functions = require("firebase-functions");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });


const stripe = require("stripe")(functions.config().stripe.testkey);

exports.stripePayment = functions.https.onRequest(async (req, res) => {
    const paymentIntent = await stripe.paymentIntents.create({
        amount:1999,
        currency: "usd"
    },
    function (err, paymentIntent){
        if (err!=null) {
            console.log(err);
        }else {
            res.json({
                paymentIntent: paymentIntent.client_secret
            })
        }
    }
    )
})
