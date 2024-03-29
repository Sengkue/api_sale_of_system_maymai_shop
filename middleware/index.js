const jwt = require('jsonwebtoken');
require('dotenv').config();

const verifyToken = (req, res, next) => {
  try {
    const header = req.headers['authorization'];
    if (!header) {
      return res.status(401).json({ message: 'Invalid token!' });
    }
    
    const token = header.split(' ')[1]; // Extract the token from the authorization header
    
    if (!token) {
      return res.status(401).json({ message: 'Invalid token!' });
    }
    
    const payload = jwt.verify(token, process.env.SECRET_KEY);
    if (!payload) {
      return res.status(401).json({ message: 'Unauthorized!' });
    }
    
    req.payload = payload;
    next();
  } catch (error) {
    req.payload = '';
    return res.status(500).json({ message: 'Internal server error!' });
  }
};

module.exports = verifyToken;

// const jwt = require('jsonwebtoken');
// require('dotenv').config();

// const verifyToken = (req, res, next) => {
//     try {
//         const header = req.headers['authorization'];
//         if(!header){
//             return res.status(401).json({message: 'Invalid token!'})
//         }
//          const token = header.split(' ');
//     if (token[0] !== 'SENG') {
//         return res.status(401).json({ message: 'Invalid token!' });
//     }
//     if (!token[1]) {
//         return res.status(401).json({ message: 'Invalid token!' });
//     }

//     const payload=jwt.verify(token[0], process.env.SECRET_KEY);
//     if(!payload){
//         return res.status(401).json({message: 'Unauthorized!'});
//     }
//     req.payload = payload;
//     next();
        
//     } catch (error) {
//         req.payload = '';
//         return res.status(500).json({message: 'Internal server !!!'});        
//     }

// }

// module.exports = verifyToken;