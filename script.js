document.addEventListener('DOMContentLoaded', function() {
    initScrollTopButton();
    initNavLinks();
    initMobileMenu();
    initCopyButtons();
    
    showActiveSection();
    
    window.addEventListener('hashchange', showActiveSection);
});

function showActiveSection() {
    let hash = window.location.hash;
    if (!hash || hash === '#') {
        hash = '#getting-started';
        window.location.hash = hash;
    }
    
    document.querySelectorAll('.doc-section').forEach(section => {
        section.style.display = 'none';
    });
    
    const activeSection = document.querySelector(hash);
    if (activeSection) {
        activeSection.style.display = 'block';
        
        const pageTitle = activeSection.querySelector('h1');
        if (pageTitle) {
            document.getElementById('pageTitle').textContent = pageTitle.textContent;
            
            const breadcrumbText = pageTitle.textContent.replace(/[^a-zA-Zа-яА-Я0-9\s]/g, '').trim();
            document.getElementById('breadcrumbText').textContent = breadcrumbText;
        }
        
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    } else {
        document.querySelector('#getting-started').style.display = 'block';
    }
    
    document.querySelectorAll('.nav-section a').forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === hash) {
            link.classList.add('active');
        }
    });
}

function initScrollTopButton() {
    const scrollButton = document.getElementById('scrollTop');
    
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            scrollButton.style.display = 'flex';
        } else {
            scrollButton.style.display = 'none';
        }
    });
    
    scrollButton.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

function initNavLinks() {
    document.querySelectorAll('.nav-section a').forEach(link => {
        link.addEventListener('click', function(e) {
            if (window.innerWidth <= 1024) {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.remove('active');
            }
        });
    });
}

function initMobileMenu() {
    const menuToggle = document.getElementById('menuToggle');
    const sidebar = document.getElementById('sidebar');
    
    menuToggle.addEventListener('click', function() {
        sidebar.classList.toggle('active');
    });
    
    document.addEventListener('click', function(event) {
        const isClickInsideSidebar = sidebar.contains(event.target);
        const isClickOnMenuToggle = menuToggle.contains(event.target);
        
        if (!isClickInsideSidebar && !isClickOnMenuToggle && sidebar.classList.contains('active')) {
            sidebar.classList.remove('active');
        }
    });
}


function initCopyButtons() {
    document.querySelectorAll('.copy-btn').forEach(button => {
        button.addEventListener('click', function() {
            copyCode(this);
        });
    });
}

function copyCode(button) {
    const codeBlock = button.closest('.code-block');
    const codeElement = codeBlock.querySelector('code');
    const codeText = codeElement.textContent;
    
    navigator.clipboard.writeText(codeText).then(() => {
        const originalText = button.textContent;
        button.textContent = 'Copied!';
        button.style.backgroundColor = '#27ae60';
        
        setTimeout(() => {
            button.textContent = originalText;
            button.style.backgroundColor = '';
        }, 2000);
    }).catch(err => {
        console.error('Ошибка при копировании: ', err);
        button.textContent = 'Ошибка!';
        button.style.backgroundColor = '#e74c3c';
    });
}

function showComingSoon() {
    alert('Этот материал скоро будет доступен для скачивания!');
}

document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        
        const targetId = this.getAttribute('href');
        if (targetId === '#') return;
        
        window.location.hash = targetId;
    });
});

function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const icon = document.getElementById('sidebarIcon');
    
    sidebar.classList.toggle('active');
    icon.className = sidebar.classList.contains('active') ? 'fas fa-times' : 'fas fa-bars';
}

document.querySelectorAll('.nav-section a').forEach(link => {
    link.addEventListener('click', function() {
        if (window.innerWidth <= 1024) {
            const sidebar = document.getElementById('sidebar');
            const icon = document.getElementById('sidebarIcon');
            
            sidebar.classList.remove('active');
            icon.className = 'fas fa-bars';
        }
    });
});