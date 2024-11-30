from setuptools import setup, find_packages

setup(
    name="app",
    version="1.0.0",
    description="A simple Python project with addition and currency exchange functions.",
    author="Your Name",
    packages=find_packages(),
    entry_points={
        "console_scripts": [
            "my_project=my_project.main:main",
        ],
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.6",
)
