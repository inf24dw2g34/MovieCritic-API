# MovieCritic-API

## Google OAuth Setup

1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. Create a new project or select an existing one.
3. Navigate to **APIs & Services > Credentials** and create an OAuth 2.0 Client ID.
4. Set the **Authorized Redirect URI** to `http://localhost:3000/auth/google/callback` for development.
5. Copy the `Client ID` and `Client Secret` and add them to your `.env` file:
   ```bash
   GOOGLE_CLIENT_ID=your_google_client_id
   GOOGLE_CLIENT_SECRET=your_google_client_secret
   GOOGLE_CALLBACK_URL=http://localhost:3000/auth/google/callback