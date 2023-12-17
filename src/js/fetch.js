document.addEventListener('DOMContentLoaded', () => {
    const repositories = ['Pingu', 'Hyper', 'Foodie', 'weather-react', 'codebook.dev'];
    repositories.forEach((repo, index) => fetchGitHubStats(repo, index));
});

function fetchGitHubStats(repositoryName, index) {
    const repoUrl = `https://api.github.com/repos/JacobPantuso/${repositoryName}`;
    const suffix = ['first', 'second', 'third', 'fourth', 'fifth'][index];

    // Fetch repository details
    fetch(`${repoUrl}`)
        .then(response => {
            if (!response.ok) throw new Error('Repo not found');
            return response.json();
        })
        .then(repoData => {
            const lastUpdated = new Date(repoData.pushed_at).toLocaleDateString("en-US", {
                month: 'short', day: 'numeric', year: 'numeric'
            });
            document.getElementById(`${suffix}-last-updated`).textContent = ` ${lastUpdated}`;
        })
        .catch(error => {
            console.error('Error fetching repository details:', error);
            document.getElementById(`${suffix}-last-updated`).textContent = ' API Request Failed';
        });

    // Fetch the number of commits
    fetch(`${repoUrl}/commits`)
        .then(response => {
            if (!response.ok) throw new Error('Commits not found');
            return response.json();
        })
        .then(commits => {
            const numberOfCommits = commits.length;
            document.getElementById(`${suffix}-number-of-commits`).textContent = ` ${numberOfCommits}`;
        })
        .catch(error => {
            console.error('Error fetching commit data:', error);
            document.getElementById(`${suffix}-number-of-commits`).textContent = ' API Request Failed';
        });
}
