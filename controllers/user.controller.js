const User = require('../models/user.model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();

exports.create= async(req, res)=>{
    const password = await bcrypt.hash(req.body.password, 5)
    const user={
        username:req.body.username,
        password:password
    }
    User.create(user).then((data)=>{
        return res.status(200).json({result: data});
    }).catch((error)=>{
        return res.status(200).json({result: error});
    })
}

exports.login = async (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    try {
      const user = await User.findOne({ where: { username: username } });
      if (user) {
        const validPassword = await bcrypt.compare(password, user.password);
        if (validPassword) {
          const token = jwt.sign({ id: user.id, username: user.username }, process.env.SECRET_KEY, { expiresIn: '31d' });
          return res.status(200).json({ result: "Login successful!", token: token });
        }
      }
      return res.status(403).json({ result: "Invalid username or password!" });
    } catch (error) {
        console.error(error); // Log the error for debugging purposes
        return res.status(500).json({ result: "Internal server error!" });
      }
  };
  

exports.findAll=(req, res)=>{
    // User.findAll().then((data)=>{ find all
        User.findAndCountAll().then((data)=>{   //find and cound items
        return res.status(200).json({result: data})
    }).catch((error)=>{
        return res.status(500).json({result: error});
    })
}

exports.findOne=(req, res)=>{
    const id = req.params.id;
    User.findOne({where:{id:id}}).then((data)=>{
        return res.status(200).json({result: data});
    }).catch((error)=>{
        return res.status(500).json({result: error});
    });
}

exports.update=(req, res)=>{
    const id = req.params.id
    const user={
        username:req.body.username,
        password:req.body.password,
    }
    User.update(user, {where:{id:id}}).then((data)=>{
        return res.status(200).json({result: data});
    }).catch((error)=>{
        return res.status(200).json({result: error});
    })
}

exports.delete=(req, res)=>{
    const id = req.params.id;
    User.destroy({where:{id:id}}).then((data)=>{
        return res.status(200).json({result: data});
    }).catch((error)=>{
        return res.status(500).json({result: error});
    });
}