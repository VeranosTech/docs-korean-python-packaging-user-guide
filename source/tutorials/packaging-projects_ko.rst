파이썬 프로젝트 패키징
=========================

이 튜토리얼을 통해 간단한 파이썬 프로젝트를 어떻게 패키징 하는지 알아본다. 패키징을 위해 필요한 파일들을 더하는 법과 구조를 구성하는 법을
알려줄 것이며 최종적으로 패키징 진행하는 법과 PPI(Python Package Index)에 업로드 하는 방법도 익힐 수 있을 것이다.

간단한 프로젝트
----------------

이 튜토리얼에서는 ``example_pkg``이라는 간단한 프로젝트를 활용한다. 혹시 파이썬 모듈과 :term:`패키지 임포팅 <import package>`
이 익숙치 않다면 `Python documentation for packages and modules`_을 먼저 읽는 것을 권한다.

이 프로젝트를 로컬에 다음과 같은 구조로 만들어라:

.. code-block:: text

    /example_pkg
      /example_pkg
        __init__.py


이 구조가 완성되었으면, 이 튜토리얼에서 행해지는 모든 커맨드는 탑레벨 폴더에서 이뤄질 것이다.
``cd example_pkg``가 되었는지 확인하라.


다음 코드를 file:`example_pkg/__init__.py` 에 입력하라.

.. code-block:: python
 name = "example_pkg"

차후 튜토리얼 내에서 설치가 잘 되었는지 확인할 수 있도록 해준다.

.. _Python documentation for packages and modules:
    https://docs.python.org/3/tutorial/modules.html#packages

패키지 파일 만들기
--------------------------

이 섹션에서 당신은 프로젝트를 패키징 하기 위한 여러 파일들을 배포가 가능한 상태로 제작할 것이다. 아래의 파일들을 만들어 보라.
이어지는 스텝들에서 파일 내부 작성도 계속 진행 될 것이다.

.. code-block:: text

    /example_pkg
      /example_pkg
        __init__.py
      setup.py
      LICENSE
      README.md


setup.py 만들기
-----------------

:file:`setup.py`는 :ref:`setuptools`을 위한 빌드 스크립트이다. 이를 통해 setuptools가 당신의 패키지의 정보를 파악하며
(이름, 버전과 같은) 어떤 코드 파일들을 포함해야하는지도 알게 된다.

:file:`setup.py`을 열고 다음 내용을 입력하라, 원한다면 내용을 당신에 맞게 수정해도 좋다.

.. code-block:: python

    import setuptools

    with open("README.md", "r") as fh:
        long_description = fh.read()

    setuptools.setup(
        name="example_pkg",
        version="0.0.1",
        author="Example Author",
        author_email="author@example.com",
        description="A small example package",
        long_description=long_description,
        long_description_content_type="text/markdown",
        url="https://github.com/pypa/example-project",
        packages=setuptools.find_packages(),
        classifiers=(
            "Programming Language :: Python :: 3",
            "License :: OSI Approved :: MIT License",
            "Operating System :: OS Independent",
        ),
    )


:func:`setup` takes several arguments. This example package uses a relatively
minimal set:

:func:`setup` 함수는 다음과 같은 여러 아규먼트를 지닌다. 이 예제 패키지에서는 상대적으로 최소한의 세트만 사용하고 있다.

- ``name`` 패키지의 이름이다. 문자와, 숫자, ``_``와  ``-``만 포함할 수 있으며 pypi.org에 중복되지 않은 이름이어야 한다.
- ``version`` 패키지의 버전이다. 자세한 사항은 :pep:`440`을 참고하라.
- ``author`` 와 ``author_email``는 저자의 정보를 확인하는 용도로 활용된다.
- ``description`` 는 패키지를 설명하는 한 문장 요약이다.
- ``long_description`` 자세한 패키지 설명이다. Python Package Index에서 패키지 설명란에 들어가게 된다.
  이 예제에서는 :file:`README.md`에서 불러와 사용하게 되며 이는 일반적인 방식이다.
- ``long_description_content_type`` 어떤 타입의 마크업이 long_description에 사용되었는지 알려준다. 이 예제에서는 마크다운이다.
- ``url`` 프로젝트 홈페이지의 URL을 알려준다. 많은 프로젝트들이 GitHub, GitLab, Bitbucket와 같은 코드 호스팅 서비스 페이지를 쓰곤 한다.
- ``packages`` :term:`distribution package`에 포함되어야 할 모든 파이썬 :term:`import packages <Import Package>`의 리스트다.
  하나하나 패키지를 수동으로 리스팅할 필요없이 :func:`find_packages`를 사용하면 자동으로 모든 패키지와 서브패키지를 찾아준다.
  여기서는 `example_pkg`가 유일하게 포함될 패키지이다.
- ``classifiers`` 인덱스와 :ref:`pip`에 추가적인 패키지에 대한 메타데이터를 알려준다. 이 예제에서는 패키지가 오직 파이썬 3 버전과 호환되고 MIT
  라이센스에 귀속되며 OS-독립적 임을 알려준다. 적어도 어떤 버전의 파이썬에서 당신의 패키지가 작동하는지, 어떤 라이센스를 지니는지, 어떤 운영체제에서
  돌아가는지는 적어주는 것이 좋다. 완전한 classifiers의 리스트를 보려면 다음을 참고하라 https://pypi.org/classifiers/.

여기 설명된 것 외에도 많은 것들이 있으니 더 자세한 내역을 알고 싶으면 아래를 살펴보라.
:doc:`/guides/distributing-packages-using-setuptools`


README.md 만들기
------------------

:file:`README.md` 을 열고 다음의 내용을 입력하라. 원한다면 넣고 싶은 내용을 넣어도 된다.

.. code-block:: md

    # Example Package

    This is a simple example package. You can use
    [Github-flavored Markdown](https://guides.github.com/features/mastering-markdown/)
    to write your content.


LICENSE 만들기
------------------

PPI에 패키지를 업로드할 때 라이센스 정보를 포함하는 것은 매우 중요하다. 당신의 패키지를 설치하고자 하는 유저들에게 어떤 경우의 패키지를 사용할 수 있는
지를 알려준다. https://choosealicense.com/ 를 참조하면 어떤 라이센스를 고를지 도움이 될 것이다. 라이센스를 골랐으면 :file:`LICENSE` 에 관련
내용을 입력하면 된다. 만약 MIT 라이센스를 골랐다면 아래 내용을 넣으면 된다.

.. code-block:: text

    Copyright (c) 2018 The Python Packaging Authority

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.


.. _generating archives:

디스트리뷰션 아카이브 생성하기
--------------------------------

다음 단계는 패키지를 위한 :term:`distribution packages <distribution package>` 만들기다.
이것은 Package Index에 업로드 되는 아카이브들로 :ref:`pip`을 통해 설치가 가능하다.

최신 버전의 ``setuptools`` 과 ``wheel``이 설치되었는지 확인하라.

.. code-block:: bash

    python3 -m pip install --user --upgrade setuptools wheel

.. tip:: 만약 설치에 애로사항이 있으면
   :doc:`installing-packages` 를 참고하라.

이제 :file:`setup.py`가 위치한 경로에서 다음 커맨드를 실행시켜라.

.. code-block:: bash

    python3 setup.py sdist bdist_wheel

실행 후엔 많은 텍스트들이 출력될 것이며 완료되면 다음 두 파일이 :file:`dist` 폴더에 생성될 것이다.

.. code-block:: text

    dist/
      example_pkg-0.0.1-py3-none-any.whl
      example_pkg-0.0.1.tar.gz

.. note:: 만약 여기서 문제를 겪고 있다면 아웃풋과 파일들을 복사해서 `packaging problems`_ 에 알려주면 최선을 다해 도움을 주겠다!

.. _packaging problems:
  https://github.com/pypa/packaging-problems/issues/new?title=Trouble+following+packaging+libraries+tutorial

``tar.gz`` 파일은 :term:`source archive`이고 반면 ``.whl`` 파일은 :term:`built distribution` 이다.
최신 ref:`pip` 버전은 빌트 디스트리뷰션을 설치하는것을 선호하나 필요시에는 소스 아카이브를 사용하기도 한다. 언제나 소스 아카이브와
당신의 프로젝트에 맞는 플랫폼의 빌트 아카이브를 둘 다 업로드해야한다. 이 예제 프로젝트는 파이썬을 사용하며 어느 플랫폼에서나 구동 가능하므로
오직 하나의 빌트 디스트리뷰션만 필요하다.

디스트리뷰션 아카이브 업로드하기
-----------------------------------
드디어 당신의 패키지를 PPI에 업로드할 시간이다!

The first thing you'll need to do is register an account on `Test PyPI`.
맨 먼저 당신이 해야하는 일은 `Test PyPI`에 계정을 등록하는 것이다. Test
PyPI 는 별도의 패키지 인덱스의 인스턴스로 테스트 및 실험용으로 사용된다. 즉, 실제 인덱스에 업로드 하고 싶지 않은 이런 튜토리얼 패키지에 적합하다.
https://test.pypi.org/account/register/ 페이지에서 계정을 등록하라. 패키지 업로드 전에 이메일 증빙 과정을 거쳐야한다.
Test PyPIF에 대해 더 자세히 알고 싶다면 다음 문서를 참고하라. :doc:`/guides/using-testpypi`.

Now that you are registered, you can use :ref:`twine` to upload the
등록이 되었으면 ref:`twine`을 통해 디스트리뷰션 패키지를 업로드할 수 있다. 다음 커맨드를 통해 Twine을 설치하라.

.. code-block:: bash

    python3 -m pip install --user --upgrade twine

설치가 되었으면 :file:`dist`: 폴더 안의 모든 아카이브를 Twine을 통해 업로드하라.

.. code-block:: bash

    twine upload --repository-url https://test.pypi.org/legacy/ dist/*

이후 Test PyPI 로그인을 진행하면 다음과 같은 아웃풋을 보게 될 것이다.

.. code-block:: bash

    Uploading distributions to https://test.pypi.org/legacy/
    Enter your username: [your username]
    Enter your password:
    Uploading example_pkg-0.0.1-py3-none-any.whl
    100%|█████████████████████| 4.65k/4.65k [00:01<00:00, 2.88kB/s]
    Uploading example_pkg-0.0.1.tar.gz
    100%|█████████████████████| 4.25k/4.25k [00:01<00:00, 3.05kB/s]

.. note:: If you get an error that says ``The user '[your username]' isn't
  allowed to upload to project 'example-pkg'``, you'll need to go and pick
  a unique name for your package. A good choice is
  ``example_pkg_your_username``. Update the ``name`` argument in
  :file:`setup.py`, remove the :file:`dist` folder, and
  :ref:`regenerate the archives <generating archives>`.

업로드가 완료되면 다음과 같이 TestPyPI에서 확인이 가능하다.
https://test.pypi.org/project/example-pkg


새로이 업로드한 패키지 설치하기
--------------------------------------

You can use :ref:`pip` to install your package and verify that it works.
Create a new :ref:`virtualenv` (see :doc:`/tutorials/installing-packages` for
detailed instructions) and install your package from TestPyPI:

:ref:`pip`을 이용하여 당신의 패키지를 설치 가능하고 잘 작동하는지 테스트를 해 볼 수 있다.
새로운 :ref:`virtualenv` 를 생성하고 (다음을 참고: :doc:`/tutorials/installing-packages`)
TestPyPI로부터 패키지를 설치하라.

.. code-block:: bash

    python3 -m pip install --index-url https://test.pypi.org/simple/ example_pkg

.. note:: 만약 전 단계에서 다른 패키지 이름을 사용했다면 커맨드라인의
  ``example_pkg`` 를  당신의 패키지 이름으로 변경하라.

pip이 패키지를 설치하게 되면 다음과 같은 아웃풋이 나타날 것이다.

.. code-block:: text

    Collecting example_pkg
      Downloading https://test-files.pythonhosted.org/packages/.../example_pkg-0.0.1-py3-none-any.whl
    Installing collected packages: example-pkg
    Successfully installed example-pkg-0.0.1

모듈이 잘 임포팅 되고 :file:`__init__.py` 에 적어놓은 ``name`이 참조되는지를 통해 패키지가 잘 설치되었는지 테스트해 볼 수 있다.

Run the Python interpreter (make sure you're still in your virtualenv):
파이썬 인터프리터를 실행시켜라 (virtualenv에서 실행하는지 체크하라)

.. code-block:: bash

    python

그리고 모듈을 임포트하고 ``name``이 잘 출력되는지 확인하라. 당신의 :term:`import package`가 ``example_pkg``이므로
어떤 이름을 :term:`distribution package`에 주었더라도 같은 결과가 출력된다.

.. code-block:: python

    >>> import example_pkg
    >>> example_pkg.name
    'example_pkg'


다음 단계
----------

**축하한다 성공리에 파이썬 프로젝트를 패키징하고 배포했다!**
✨ 🍰 ✨

이 튜토리얼에서는 패키지를 TestPyPI에 업로드했으나 이는 영구적이지 않음을 명심하라. 종종 Test PyPI에 있는 패키지나 계정이 삭제되곤 한다.
실제 PPI에 업로드를 하기 위해서는 https://pypi.org 에 계정을 등록해야하고 업로드시에 ``twine upload dist/*`` 커맨드를 사용해야한다.
설치 시에는 ``pip install your-package`` 커맨드를 사용하라.

파이썬 라이브러리 패키징에 대해 좀 더 자세히 알고 싶으면 아래를 참조하라:

* :ref:`setuptools` 을 활용한 라이브러리 패키징
  :doc:`/guides/distributing-packages-using-setuptools`.
* :doc:`/guides/packaging-binary-extensions`.
* :ref:`setuptools` 대안으로 :ref:`flit`, `hatch`_,
  그리고 `poetry`_ 도 가능하다.

.. _hatch: https://github.com/ofek/hatch
.. _poetry: https://github.com/sdispater/poetry
