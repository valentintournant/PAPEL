const selectCategory = () => {

  const labels = document.querySelectorAll('.category-choices label');
  const categoryInput = document.querySelector('#category_value');

  labels.forEach((label) => {

    label.addEventListener('click', (event) => {
      console.log(event.currentTarget);

      const activeElement = document.querySelector('.category-choices .active');

      if (activeElement) {
        activeElement.classList.remove('active');
      }

      event.currentTarget.classList.add('active');

      categoryInput.value = event.currentTarget.attributes.for.value


    })
  })
}

export { selectCategory }
