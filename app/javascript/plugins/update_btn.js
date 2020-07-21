const updateBtn = () => {
  const btns = document.querySelectorAll('.undo-btn');
  btns.forEach(btn => {
    btn.addEventListener('click', () => {
      btn.insertAdjacentHTML('afterend', selectBtn(btn.innerText, btn.id));
      btn.remove();
      updateBtn();
    })
  })
}

const selectBtn = (value, id) => {
  if (value === "Undo") {
    return `
      <a class="btn btn-lg w-100 undo-btn" id="${id}" data-remote="true" rel="nofollow" data-method="patch" href="/chapter_subscriptions/${id}">Got it!</a>
    `
  } else {
    return `
      <a class="btn btn-secondary btn-lg w-100 undo-btn" id="${id}" data-remote="true" rel="nofollow" data-method="patch" href="/chapter_subscriptions/${id}">Undo</a>
    `
  }
}

export default updateBtn;
