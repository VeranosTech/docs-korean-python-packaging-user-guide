��    ;      �              �  S   �  �   !  Z   �     &  �   7  e   "  X   �     �     �            F   4      {  R   �  e  �  �   U	  ~   �	  &   \
  t  �
  6  �  Q   /  
   �  O   �  x   �  K   U  q   �  �     ]   �  b   	     l  6   �  v   �  G   4  �  |    L  �   d  }   %  t   �  W     �   p  �   [  D   D  #   �  �   �  �   @  Y     �   p  �     O   �  �    @   �  �   &   �   �   �   �!  j  7"  �   �#  O   A$  ]   �$  �  �$  S   v&  �   �&  Z   t'     �'  �   �'  e   �(  X   1)     �)     �)     �)     �)  F   �)      $*  R   E*  e  �*  �   �+  ~   �,  &   -  t  ,-  6  �.  Q   �0  
   *1  O   51  x   �1  K   �1  q   J2  �   �2  ]   T3  b   �3     4  6   /4  v   f4  G   �4  �  %5    �6  �   9  }   �9  t   L:  W   �:  �   ;  �   <  D   �<  #   2=  �   V=  �   �=  Y   �>  �   ?  �   �?  O   k@  �  �@  @   �B  �   �B  �   TC  �   ;D  j  �D  �   KF  O   �F  ]   :G   **Congratulations, you've packaged and distributed a Python project!** ✨ 🍰 ✨ :file:`setup.py` is the build script for :ref:`setuptools`. It tells setuptools about your package (such as the name and version) as well as which code files to include. :func:`setup` takes several arguments. This example package uses a relatively minimal set: A simple project And then import the module and print out the ``name`` property. This should be the same regardless of what you name you gave your :term:`distribution package` in :file:`setup.py` because your :term:`import package` is ``example_pkg``. At this point if you want to read more on packaging Python libraries here are some things you can do: Consider alternatives to :ref:`setuptools` such as :ref:`flit`, `hatch`_, and `poetry`_. Creating README.md Creating a LICENSE Creating setup.py Creating the package files Finally, it's time to upload your package to the Python Package Index! Generating distribution archives IF you have trouble installing these, see the :doc:`installing-packages` tutorial. If you get an error that says ``The user '[your username]' isn't allowed to upload to project 'example-pkg'``, you'll need to go and pick a unique name for your package. A good choice is ``example_pkg_your_username``. Update the ``name`` argument in :file:`setup.py`, remove the :file:`dist` folder, and :ref:`regenerate the archives <generating archives>`. If you run into trouble here, please copy the output and file an issue over on `packaging problems`_ and we'll do our best to help you! If you used a different package name in the preview step, replace ``example_pkg`` in the command above with your package name. Installing your newly uploaded package It's important for every package uploaded to the Python Package Index to include a license. This tells users who install your package the terms under which they can use your package. For help picking a license, see https://choosealicense.com/. Once you have chosen a license, open :file:`LICENSE` and enter the license text. For example, if you had chosen the MIT license: Keep in mind that this tutorial showed you how to upload your package to Test PyPI and Test PyPI is ephemeral. It's not unusual for packages and accounts to be deleted occasionally. If you want to upload your package to the real Python Package Index you can do it by registering an account on https://pypi.org and following the same instructions, however, use ``twine upload dist/*`` to upload your package and enter your credentials for the account you registered on the real PyPI. You can install your package from the real PyPI using ``pip install your-package``. Make sure you have the latest versions of ``setuptools`` and ``wheel`` installed: Next steps Now run this command from the same directory where :file:`setup.py` is located: Now that you are registered, you can use :ref:`twine` to upload the distribution packages. You'll need to install Twine: Once installed, run Twine to upload all of the archives under :file:`dist`: Once uploaded your package should be viewable on TestPyPI, for example, https://test.pypi.org/project/example-pkg Once you create this structure, you'll want to run all of the commands in this tutorial within the top-level folder - so be sure to ``cd example_pkg``. Open :file:`README.md` and enter the following content. You can customize this if you'd like. Open :file:`setup.py` and enter the following content, you can personalize the values if you want: Packaging Python Projects Read about :doc:`/guides/packaging-binary-extensions`. Read more about using :ref:`setuptools` to package libraries in :doc:`/guides/distributing-packages-using-setuptools`. Run the Python interpreter (make sure you're still in your virtualenv): The ``tar.gz`` file is a :term:`source archive` whereas the ``.whl`` file is a :term:`built distribution`. Newer :ref:`pip` versions preferentially install built distributions, but will fall back to source archives if needed. You should always upload a source archive and provide built archives for the platforms your project is compatible with. In this case, our example package is compatible with Python on any platform so only one built distribution is needed. The first thing you'll need to do is register an account on `Test PyPI`. Test PyPI is a separate instance of the package index intended for testing and experimentation. It's great for things like this tutorial where we don't necessarily want to upload to the real index. To register an account, go to https://test.pypi.org/account/register/ and complete the steps on that page. You will also need to verify your email address before you're able to upload any packages.  For more details on Test PyPI, see :doc:`/guides/using-testpypi`. The next step is to generate :term:`distribution packages <distribution package>` for the package. These are archives that are uploaded to the Package Index and can be installed by :ref:`pip`. There are many more than the ones mentioned here. See :doc:`/guides/distributing-packages-using-setuptools` for more details. This command should output a lot of text and once completed should generate two files in the :file:`dist` directory: This is just so that you can verify that it installed correctly later in this tutorial. This tutorial uses a simple project named ``example_pkg``. If you are unfamiliar with Python's modules and :term:`import packages <import package>`, take a few minutes to read over the `Python documentation for packages and modules`_. This tutorial walks you through how to package a simple Python project. It will show you how to add the necessary files and structure to create the package, how to build the package, and how to upload it to the Python Package Index. To create this project locally, create the following file structure: Uploading the distribution archives You can test that it was installed correctly by importing the module and referencing the ``name`` property you put in :file:`__init__.py` earlier. You can use :ref:`pip` to install your package and verify that it works. Create a new :ref:`virtualenv` (see :doc:`/tutorials/installing-packages` for detailed instructions) and install your package from TestPyPI: You should also edit :file:`example_pkg/__init__.py` and put the following code in there: You will be prompted for the username and password you registered with Test PyPI. After the command completes, you should see output similar to this: You will now create a handful of files to package up this project and prepare it for distribution. Create the new files listed below - you will add content to them in the following steps. ``author`` and ``author_email`` are used to identify the author of the package. ``classifiers`` tell the index and :ref:`pip` some additional metadata about your package. In this case, the package is only compatible with Python 3, is licensed under the MIT license, and is OS-independent. You should always include at least which version(s) of Python your package works on, which license your package is available under, and which operating systems your package will work on. For a complete list of classifiers, see https://pypi.org/classifiers/. ``description`` is a short, one-sentence summary of the package. ``long_description_content_type`` tells the index what type of markup is used for the long description. In this case, it's Markdown. ``long_description`` is a detailed description of the package. This is shown on the package detail package on the Python Package Index. In this case, the long description is loaded from :file:`README.md` which is a common pattern. ``name`` is the name of your package. This can be any name as long as only contains letters, numbers, ``_`` , and ``-``. It also must not already taken on pypi.org. ``packages`` is a list of all Python :term:`import packages <Import Package>` that should be included in the :term:`distribution package`. Instead of listing each package manually, we can use :func:`find_packages` to automatically discover all packages and subpackages. In this case, the list of packages will be `example_pkg` as that's the only package present. ``url`` is the URL for the homepage of the project. For many projects, this will just be a link to GitHub, GitLab, Bitbucket, or similar code hosting service. ``version`` is the package version see :pep:`440` for more details on versions. pip should install the package from Test PyPI and the output should look something like this: Project-Id-Version: Python Packaging User Guide 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-12-18 14:42+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ko
Language-Team: ko <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 **Congratulations, you've packaged and distributed a Python project!** ✨ 🍰 ✨ :file:`setup.py` is the build script for :ref:`setuptools`. It tells setuptools about your package (such as the name and version) as well as which code files to include. :func:`setup` takes several arguments. This example package uses a relatively minimal set: A simple project And then import the module and print out the ``name`` property. This should be the same regardless of what you name you gave your :term:`distribution package` in :file:`setup.py` because your :term:`import package` is ``example_pkg``. At this point if you want to read more on packaging Python libraries here are some things you can do: Consider alternatives to :ref:`setuptools` such as :ref:`flit`, `hatch`_, and `poetry`_. Creating README.md Creating a LICENSE Creating setup.py Creating the package files Finally, it's time to upload your package to the Python Package Index! Generating distribution archives IF you have trouble installing these, see the :doc:`installing-packages` tutorial. If you get an error that says ``The user '[your username]' isn't allowed to upload to project 'example-pkg'``, you'll need to go and pick a unique name for your package. A good choice is ``example_pkg_your_username``. Update the ``name`` argument in :file:`setup.py`, remove the :file:`dist` folder, and :ref:`regenerate the archives <generating archives>`. If you run into trouble here, please copy the output and file an issue over on `packaging problems`_ and we'll do our best to help you! If you used a different package name in the preview step, replace ``example_pkg`` in the command above with your package name. Installing your newly uploaded package It's important for every package uploaded to the Python Package Index to include a license. This tells users who install your package the terms under which they can use your package. For help picking a license, see https://choosealicense.com/. Once you have chosen a license, open :file:`LICENSE` and enter the license text. For example, if you had chosen the MIT license: Keep in mind that this tutorial showed you how to upload your package to Test PyPI and Test PyPI is ephemeral. It's not unusual for packages and accounts to be deleted occasionally. If you want to upload your package to the real Python Package Index you can do it by registering an account on https://pypi.org and following the same instructions, however, use ``twine upload dist/*`` to upload your package and enter your credentials for the account you registered on the real PyPI. You can install your package from the real PyPI using ``pip install your-package``. Make sure you have the latest versions of ``setuptools`` and ``wheel`` installed: Next steps Now run this command from the same directory where :file:`setup.py` is located: Now that you are registered, you can use :ref:`twine` to upload the distribution packages. You'll need to install Twine: Once installed, run Twine to upload all of the archives under :file:`dist`: Once uploaded your package should be viewable on TestPyPI, for example, https://test.pypi.org/project/example-pkg Once you create this structure, you'll want to run all of the commands in this tutorial within the top-level folder - so be sure to ``cd example_pkg``. Open :file:`README.md` and enter the following content. You can customize this if you'd like. Open :file:`setup.py` and enter the following content, you can personalize the values if you want: Packaging Python Projects Read about :doc:`/guides/packaging-binary-extensions`. Read more about using :ref:`setuptools` to package libraries in :doc:`/guides/distributing-packages-using-setuptools`. Run the Python interpreter (make sure you're still in your virtualenv): The ``tar.gz`` file is a :term:`source archive` whereas the ``.whl`` file is a :term:`built distribution`. Newer :ref:`pip` versions preferentially install built distributions, but will fall back to source archives if needed. You should always upload a source archive and provide built archives for the platforms your project is compatible with. In this case, our example package is compatible with Python on any platform so only one built distribution is needed. The first thing you'll need to do is register an account on `Test PyPI`. Test PyPI is a separate instance of the package index intended for testing and experimentation. It's great for things like this tutorial where we don't necessarily want to upload to the real index. To register an account, go to https://test.pypi.org/account/register/ and complete the steps on that page. You will also need to verify your email address before you're able to upload any packages.  For more details on Test PyPI, see :doc:`/guides/using-testpypi`. The next step is to generate :term:`distribution packages <distribution package>` for the package. These are archives that are uploaded to the Package Index and can be installed by :ref:`pip`. There are many more than the ones mentioned here. See :doc:`/guides/distributing-packages-using-setuptools` for more details. This command should output a lot of text and once completed should generate two files in the :file:`dist` directory: This is just so that you can verify that it installed correctly later in this tutorial. This tutorial uses a simple project named ``example_pkg``. If you are unfamiliar with Python's modules and :term:`import packages <import package>`, take a few minutes to read over the `Python documentation for packages and modules`_. This tutorial walks you through how to package a simple Python project. It will show you how to add the necessary files and structure to create the package, how to build the package, and how to upload it to the Python Package Index. To create this project locally, create the following file structure: Uploading the distribution archives You can test that it was installed correctly by importing the module and referencing the ``name`` property you put in :file:`__init__.py` earlier. You can use :ref:`pip` to install your package and verify that it works. Create a new :ref:`virtualenv` (see :doc:`/tutorials/installing-packages` for detailed instructions) and install your package from TestPyPI: You should also edit :file:`example_pkg/__init__.py` and put the following code in there: You will be prompted for the username and password you registered with Test PyPI. After the command completes, you should see output similar to this: You will now create a handful of files to package up this project and prepare it for distribution. Create the new files listed below - you will add content to them in the following steps. ``author`` and ``author_email`` are used to identify the author of the package. ``classifiers`` tell the index and :ref:`pip` some additional metadata about your package. In this case, the package is only compatible with Python 3, is licensed under the MIT license, and is OS-independent. You should always include at least which version(s) of Python your package works on, which license your package is available under, and which operating systems your package will work on. For a complete list of classifiers, see https://pypi.org/classifiers/. ``description`` is a short, one-sentence summary of the package. ``long_description_content_type`` tells the index what type of markup is used for the long description. In this case, it's Markdown. ``long_description`` is a detailed description of the package. This is shown on the package detail package on the Python Package Index. In this case, the long description is loaded from :file:`README.md` which is a common pattern. ``name`` is the name of your package. This can be any name as long as only contains letters, numbers, ``_`` , and ``-``. It also must not already taken on pypi.org. ``packages`` is a list of all Python :term:`import packages <Import Package>` that should be included in the :term:`distribution package`. Instead of listing each package manually, we can use :func:`find_packages` to automatically discover all packages and subpackages. In this case, the list of packages will be `example_pkg` as that's the only package present. ``url`` is the URL for the homepage of the project. For many projects, this will just be a link to GitHub, GitLab, Bitbucket, or similar code hosting service. ``version`` is the package version see :pep:`440` for more details on versions. pip should install the package from Test PyPI and the output should look something like this: 