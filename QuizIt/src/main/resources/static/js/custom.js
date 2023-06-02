document.getElementById("departmentSearch").addEventListener("change", () => {
    document.getElementById("searchform").submit();
});

document.getElementById("confirmDelete").addEventListener('shown.bs.modal', e => {
        const btn = e.target.getElementsByClassName('btn-ok')[0]
        btn.href = e.relatedTarget.dataset.href
        console.log(btn.href)
        btn.addEventListener('click', p=>
            window.location=btn.href
        )

    }
)
