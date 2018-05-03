#!/usr/bin/env node

const comm = require('commander');
const inq = require('inquirer');
var mysql = require('mysql');

let money = 0;


var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "erty",
    database: "qvgdlt"
});

comm
    .version('0.1.0')
    .option('-r, --regles', 'Affichage des règles')
    .option('-p, --principe', 'Affichage du principe.')
    .parse(process.argv);

console.log('|                                   |')
console.log('|       Bonjour et bienvenue        |')
console.log('|       dans notre jeu de fou       |')
console.log('|ᚔ   Qui veut gagner de la THUNE  ᚔ |')
console.log('|                $$$                |')
console.log('|                                   |')

console.log('--------------------------------------')
console.log('Êtes-vous prêt à vous amuser ?')
console.log('--------------------------------------')

inq.prompt([
    {
        type: 'list',
        name: 'choix',
        message: 'Sélectionner l\'option de votre choix',
        choices: ['Commencer', 'Quitter']
    } ])
    .then((answers) => {
        var i =1
            if(answers.choix == 'Commencer') {
                questionnaire(i)
            }
            else {
                process.exit()
            }
        
    });    
if (comm.regles) console.log('\nLes règles sont les suivantes: ');
if (comm.regles) console.log('  - Il y a au total 8 questions !');
if (comm.regles) console.log('  - Chaque bonne réponse augmente l\'argent que vous pouvez obtenir.');
if (comm.regles) console.log('  - Les mauvaises réponses ne vous rapportent pas, mais vous laissent en jeu !');
if (comm.regles) console.log('  - Vous répondrez aux questions a l\'aide des flêches directionnelles de votre clavier.');


if (comm.principe) console.log('  - Le principe est assez simple, il faut S\'ENRICHIR en répondant aux questions ! Vous pouvez gagner maximum 1500€ !');

function questionnaire(i){
question(i).then((question) => {
    reponse(i).then((reponse) => {
        bonne_reponse(i).then((bonne_reponse) => { 
            inq.prompt([{
                type: 'list',
                name: 'q1',
                message: question,
                choices: reponse
            }]).then((answers) => {
                if(answers.q1 == bonne_reponse) {
                    console.log('Bonne réponse !')
                    money = money + 300
                    console.log('Vous avez gagné '+money+'€.')
                    i++ 
                    if(money == 1500 || i == 9){
                        process.exit();
                        }
                    questionnaire(i)
                    }
                else {
                    console.log('C\'est la mauvaise réponse. La bonne réponse était '+bonne_reponse+'.')
                    console.log('Vous n\'avez rien gagné. Votre cagnotte reste à '+money+'€.')
                    i++
                    if(money == 1500 || i == 9){
                        process.exit();
                        }
                    questionnaire(i)
                    }
                })
            });
        });
    })
}

function question(i){
    return new Promise((resolve, reject) => {
        var sql = "SELECT * FROM Questions where id = ";
        sql = sql + i
        con.query(sql, function (err, result, fields) {
            if (err) throw err;
            id = result[0].id
            resolve (result[0].question);
        });
    })
}

function reponse(i){
    return new Promise((resolve, reject) => {
        var sql = "SELECT reponse FROM Réponses where id_question = ";
        sql = sql + i
        con.query(sql, function (err, result, fields) {
            if (err) throw err;
            var table=[]
                result.forEach(element => {
                    table.push(element.reponse)
                });
            resolve(table)
        });
    })
}

function bonne_reponse(i){
    return new Promise((resolve, reject) => {
    var sql = "SELECT reponse FROM Réponses where bonne_reponse = 1 AND id_question = ";
    sql = sql + i
    con.query(sql, function (err, result, fields) {
        if (err) throw err;
            result.forEach(element => {
                resolve(element.reponse)
            });
        });
    });
}