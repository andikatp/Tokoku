const mongoose = require('mongoose');

const productSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    description: {
        type: String,
        requred: true,
        trim: true,
    }, 
    images:{
        type: [
            {
                type: String,
                required: true,
            },
        ],
    },
    quantity:{
        type: Number,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    category: {
        type: String,
        required: true,
    },
});

const Product = mongoose.model('Product', productSchema);
module.exports = Product;