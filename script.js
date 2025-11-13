const express = require('express')
const mysql = require('mysql2/promise')
const session = require('express-session')


const app = express()
app.use(express.json())

app.use(express.urlencoded({ extended: true}))
app.use(session({
        secret: 'juliasouza',
        resave: false,
        saveUninitialized: false
    })
)

app.listen(3000)

//Você está utilizando ui mas esta pasta não existe!
// Noooooooo .


//obgd divo

app.get('/', (req, res) =>{

    const existe = req.session.usuario

    if(existe){
        res.sendFile(__dirname + "/ui/index.html")
    }else{
        res.redirect("/login")
    }

    res.sendFile(__dirname + "/ui/index.html")
})

app.get('/login', (req, res) =>{
    res.sendFile(__dirname + "/ui/login.html")
})

app.post('/login', (req, res) =>{
    const { usuario, senha } = req.body

    if(usuario == "senai" && senha == "123"){

        req.session.usuario = usuario;

        res.redirect("/")
     }else{
        res.redirect("/login")
    }
})

app.get('/sair', (req, res) =>{
    req.session.destroy()
    res.redirect("/login")
})





//aula passada
const conn = mysql.createPool({
    host:"localhost",
    user:"root",
    password:"",
    database:"produtos_de_limpaza"
})

const produto = []





app.get("/produtos", async (req, res) =>{

    try{
        const mysql2 = "SELECT id_produto, nome, marca, estoque FROM  cadastro_produtos;"

        const [produtoLista] = await conn.query(mysql2)

         res.json({
         produto: produtoLista
         })
    }catch(error){
        console.log(error)
        res.status(500).json({erro: "Erro no servidor"})
    }
})



app.post("/produtos", async(req, res) =>{
   const {nome,marca,volume_ml,tipo_embalagem,aplicacao,estoque,estoque_minimo} = req.body


   produto.push({
    nome, 
    marca,
    volume_ml,
    tipo_embalagem,
    aplicacao,
    estoque,
    estoque_minimo
   })

   try{
        const sql = "INSERT INTO cadastro_produtos(nome, marca, volume_ml, tipo_embalagem, aplicacao, estoque, estoque_minimo) VALUES (?,?,?,?,?,?,?);"

        await conn.query(sql, [nome,marca,volume_ml,tipo_embalagem,aplicacao,estoque,estoque_minimo])

        res.json({
            msg:"Produto Cadastrado"
        })
    } catch (error){
        console.error(error)
        res.status(500).json({ erro: "Erro no servidor"})
    }
})
   

app.put
 