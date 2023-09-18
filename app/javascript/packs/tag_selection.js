// document.addEventListener('DOMContentLoaded', function() {
//     const addTagButton = document.querySelector('#add-tag-button');
//     const tagContainer = document.querySelector('#tags-container');

//     addTagButton.addEventListener('click', function() {
//         const tagWrapper = document.createElement('div');
//         tagWrapper.classList.add('tag-wrapper');

//         const newTagSelect = document.createElement('select');
//         newTagSelect.name = 'post[tag_ids][]';

//         fetch("/api/tags")
//         .then(response => response.json())
//         .then(tags => {
//             tags.forEach(tag => {
//                 const option = document.createElement('option');
//                 option.value = tag.id;
//                 option.text = tag.tag;
//                 newTagSelect.appendChild(option);
//             });
//             tagWrapper.appendChild(newTagSelect);

//             const removeButton = document.createElement('button');
//             removeButton.innerText = '削除';
//             removeButton.type = 'button'; // これはフォームの送信を防ぐためです。
//             removeButton.addEventListener('click', function() {
//                 tagWrapper.remove();
//             });
//             tagWrapper.appendChild(removeButton);

//             tagContainer.appendChild(tagWrapper);
//         });
//     });
// });
