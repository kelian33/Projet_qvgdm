#!/usr/bin/env node

/**
 * Module dependencies.
 */

const comm = require('commander')
const inq = require('inquirer')


comm
    .version('0.1.0')
    .option('-r, --regles', 'Affichage des règles')
    .option('-p, --principe', 'Le principe est simple: S\'ENRICHIR')
    .option('-b, --begin', 'Début du jeu')
    .option('-m, --money', 'Votre argent :')
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
        choices: ['Commencer', 
        'Quitter']
    } ])
    .then((answers) => {
        console.log(answers)
            if(answers.choix == 'Commencer') {
                inq.prompt([{
                    type: 'list',
                    name: 'q1',
                    message: 'Qui est la reine d\'Angleterre ?',
                    choices: ['Vous', 'Moi', 'Kélian', 'Elizabeth']
                }]).then((answers) => 
                    {
                        if(answers.q1 == 'Elizabeth') {
                                console.log('Bonne réponse')
                            } else {
                                console.log('Mauvaise réponse')
                            }
                        
                    });
                }

            else {
                process.exit()
            }
    });
    
    //TODO si le choix est "coomencernijirfhd" {question} sinon {quitter}
    



            
  

console.log('Le paramètre que vous avez choisis est: ');
if (comm.regles) console.log('- Les règles sont les suivantes: ');
if (comm.regles) console.log('  - Attenton à la casse des réponses.');
if (comm.regles) console.log('  - Chaque bonne réponse augmente l\'argent que vous pouvez obtenir.');
if (comm.principe) console.log('  - Le principe est assez simple, il faut S\'ENRICHIR');
if (comm.money) console.log('- Votre cagnotte est de :')