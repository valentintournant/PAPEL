const initLoader = () => {
  const submit = document.getElementById('submit');

  if (submit) {
    submit.addEventListener('click',() => {
      const premium = document.getElementById('premium');
      if (premium) {
        premium.classList.add("d-none");
      }

      const loader = document.getElementById('loader')
      if (loader) {
        loader.classList.remove("d-none")
      }
    })
  }
};

export { initLoader };


// const button = document.querySelector('#clickme');
// const audio = new Audio('sound.mp3');

// button.addEventListener('click', (e) => {
//   e.target.classList.add('disabled');
//   e.target.innerText = 'Bingo!';
//   audio.play();
// });
