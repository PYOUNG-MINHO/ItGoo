<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
:root {
    --accent: #04da97;
    --border-width: 6px;
    --border-radius: 55px;
    --font-size: 30px;
}

body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
    background-color: #333;
    font-family: sans-serif;
}

.container {
    perspective: 800px;
}

.toggle {
    position: relative;
    border: solid var(--border-width) var(--accent);
    border-radius: var(--border-radius);
    transition: transform cubic-bezier(0, 0, 0.30, 2) .4s;
    transform-style: preserve-3d;
    perspective: 800px;
}

.toggle>input[type="radio"] {
    display: none;
}

.toggle>#choice1:checked~#flap {
    transform: rotateY(-180deg);
}

.toggle>#choice1:checked~#flap>.content {
    transform: rotateY(-180deg);
}

.toggle>#choice2:checked~#flap {
    transform: rotateY(0deg);
}

.toggle>label {
    display: inline-block;
    min-width: 170px;
    padding: 30px;
    font-size: var(--font-size);
    text-align: center;
    color: var(--accent);
    cursor: pointer;
}

.toggle>label,
.toggle>#flap {
    font-weight: bold;
    text-transform: capitalize;
}

.toggle>#flap {
    position: absolute;
    top: calc( 0px - var(--border-width));
    left: 50%;
    height: calc(100% + var(--border-width) * 2);
    width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: var(--font-size);
    background-color: var(--accent);
    border-top-right-radius: var(--border-radius);
    border-bottom-right-radius: var(--border-radius);
    transform-style: preserve-3d;
    transform-origin: left;
    transition: transform cubic-bezier(0.4, 0, 0.2, 1) .5s;
}

.toggle>#flap>.content {
    color: #333;
    transition: transform 0s linear .25s;
    transform-style: preserve-3d;
}
</style>
<body>
<div class="container">

        <form class="toggle">

            <input type="radio" id="choice1" name="choice" value="creative">
            <label for="choice1">입양유지</label>

            <input type="radio" id="choice2" name="choice" value="productive">
            <label for="choice2">입양 철회</label>

            <div id="flap"><span class="content">생명을 소중하고,입양은 신중하게</span></div>

        </form>

    </div>
</body>
<script type="text/javascript">
const st = {};

st.flap = document.querySelector('#flap');
st.toggle = document.querySelector('.toggle');

st.choice1 = document.querySelector('#choice1');
st.choice2 = document.querySelector('#choice2');

st.flap.addEventListener('transitionend', () => {

    if (st.choice1.checked) {
        st.toggle.style.transform = 'rotateY(-15deg)';
        setTimeout(() => st.toggle.style.transform = '', 400);
    } else {
        st.toggle.style.transform = 'rotateY(15deg)';
        setTimeout(() => st.toggle.style.transform = '', 400);
    }

})

st.clickHandler = (e) => {

    if (e.target.tagName === 'LABEL') {
        setTimeout(() => {
            st.flap.children[0].textContent = e.target.textContent;
        }, 250);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    st.flap.children[0].textContent = st.choice2.nextElementSibling.textContent;
});

document.addEventListener('click', (e) => st.clickHandler(e));

</script>
</html>