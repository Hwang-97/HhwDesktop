let i = 0,
    j = 0;

const textArray = ["Development", "Coding", "Algorithm"];
const speed = 110;
target = document.getElementById("textID");

function txtnum() {
    j == textArray.length - 1 ? j = 0 : j++;
}

function type() {
    i < textArray[j].length ? (target.innerHTML += textArray[j].charAt(i), i++, setTimeout(type, speed)) : setTimeout(remove, speed);
}

function remove() {
    0 <= i ? (target.innerHTML = target.innerHTML.slice(0, i), i--, setTimeout(remove, speed)) : (type(), txtnum());
}

type();
//=====================================================================================================================typing ▲
let content2 = document.getElementById('content2ID');
let content3 = document.getElementById('content3ID');
let content4 = document.getElementById('content4ID');

const profilebtn = document.getElementById('profilebtn');
const projectbtn = document.getElementById('projectbtn');
const skillbtn = document.getElementById('skillbtn');

profilebtn.onclick = profileAni;
projectbtn.onclick = projectAni;
skillbtn.onclick = certificateAni;

function profileAni() {
    if (content2.className == 'contentOff' || content2.className=='contentStart'){
        profilebtn.className = 'button_click';
        content2.className = 'contentOn';
    }
}
function projectAni() {
    if (content3.className == 'contentOff' || content3.className=='contentStart'){
        projectbtn.className = 'button_click';
        content3.className = 'contentOn';
    }
}
function certificateAni() {
    if (content4.className == 'contentOff' || content4.className=='contentStart'){
        skillbtn.className = 'button_click';
        content4.className = 'contentOn';
    }
}
//=====================================================================================================================pageON ▲
const cencleButton = document.getElementsByClassName('cencle');
cencleButton[0].onclick = contentCencle1;
cencleButton[1].onclick = contentCencle2;
cencleButton[2].onclick = contentCencle3;

function contentCencle1(){
    profilebtn.className = 'button';
    content2.className = 'contentOff';
}
function contentCencle2(){
    projectbtn.className = 'button';
    content3.className = 'contentOff';
}
function contentCencle3(){
    skillbtn.className = 'button';
    content4.className = 'contentOff';
}
//====================================================================================================================pageOFF ▲
const project1 = document.getElementById('project1');
const project2 = document.getElementById('project2');
const project3 = document.getElementById('project3');

const left = document.getElementById("leftBtn");
const right = document.getElementById('rightBtn');
const maxPage = document.getElementsByName('project').length;

let page=1;
const pagePreName = "#project";

left.onclick = function(){
    if(page!=1){
        page--;
        left.href = pagePreName+page;
    }else{
        alert("첫 페이지 입니다.");
    }
}
right.onclick = function(){
    if(page!=maxPage){
        page++;
        right.href = pagePreName+page;
    }else{
        alert("마지막 페이지 입니다.");
    }
}
// ========================================================================================================================
const gitHubLink = document.getElementById('gitHubLink');
const blogeLink = document.getElementById('blogeLink');
const contactLink = document.getElementById('contactLinkId');

const contactCard = document.getElementById('contactCard');

gitHubLink.onclick = function(){
    window.location.href="https://github.com/Hwang-97";
};
blogeLink.onclick = function(){
    window.location.href="https://beginner-programmer.tistory.com/";
};
contactLink.onclick = function(){
    if(contactCard.className == 'contactCardOff'){
        contactLink.className='contactLink_click';
        contactCard.className = 'contactCardOn';
    }else if(contactCard.className == 'contactCardOn'){
        contactCard.className = 'contactCardOff';
        contactLink.className='contactLink';
    }
}