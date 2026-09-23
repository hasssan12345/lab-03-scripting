#!/usr/bin/env python3
"""Fetch and display recent GitHub events for a user."""

import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'


def retrieve_events(url):
    """Download JSON data from url and return it as a Python object."""
    response = requests.get(url)
    data = response.text
    return json.loads(data)


def print_events(events, n=5):
    """Print the first n events in 'type :: repo' format."""
    for x in events[:n]:
        event = x['type'] + ' :: ' + x['repo']['name']
        print(event)


def main():
    """Print user/URL info and display recent GitHub events."""
    print(f"GitHub user: {GHUSER}")
    print(f"URL: {url}")
    events = retrieve_events(url)
    print_events(events)


if __name__ == "__main__":
    main()
