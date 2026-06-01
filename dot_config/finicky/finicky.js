const googleMeetApp = {
    browser: (url) => ({
        name: "Google Chrome",
        // Replace "Default" below if your profile name is different (see Step 3)
        profile: "tasman.ai",
        args: [
            // Replace the value below with your own Shortcut ID (see Step 4)
            `--app-id=kjgfgldnnfoeklkmfkjfagphfepbbdan`,
            `--app-launch-url-for-shortcuts-menu-item=${url.toString()}`,
        ],
    }),
}

export default {
    defaultBrowser: "Google Chrome", // Or your browser
    handlers: [
        {
            match: ["meet.google.com/*"],
            ...googleMeetApp
        }
    ]
};