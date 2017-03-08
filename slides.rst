:title: Requirements Revisited
:author: Christopher Arndt
:date: 2017-03-08
:description: Empfohlene Verfahrensweisen für die Verwaltung und Installation
    von Abhängigkeiten von Python-Anwendungen und -Bibliotheken
:keywords: presentation, restructuredtext, python, packaging, setup.py,
    requirements, requirements.txt, dependencies, pip, pip-tools
:css: slides.css

----

Requirements Revisited
======================

----

Wie man Abhängigkeiten von Python-Anwendungen und -Bibliotheken verwaltet und installiert
=========================================================================================

-----

Best Practices
--------------

* Pinne *alle* Dependencies (recursiv) in den Requirements-Dateien.
* Aber *nicht* in den ``install_requires`` in der ``setup.py``.
* Benutze tox_ zum testen.
* Benutze ``tests_require`` und ``setup_requires`` nicht.
* Verwalte die Requirements mit pip-tools_.
* Optional: Hoste deine Pakete in einem Package Index mit devpi_.

-----

Zum Mitmachen
-------------


* Python 2.7+ oder 3.4+
* pip_ (https://pip.pypa.io/)
* virtualenv_ (https://virtualenv.pypa.io/)
* cookiecutter_ 1.5+ (https://github.com/audreyr/cookiecutter)
* Git

----

Folien
------

* http://github.com/SpotlightKid/talk-requirements-revisited


-----


Cookiecutter
------------


::

    pip install --user "cookiecutter>=1.5"

oder::

    pip install --user pipsi
    pipsi install "cookiecutter>=1.5"

----

Beispielprojekt mit Cookiercutter anlegen
-----------------------------------------

::

    cookiecutter gh:SpotlightKid/python-package-cookiecutter
    [...]
    project_name [My New Package]: Pep Pager
    [...]
    package_name [pep_pager]: peppager
    [...]
    project_description [...]: Download and show PEPs with less
    [...]

----

Beispielprojekt testen
----------------------

Test::

    virtualenv venv
    source venv/bin/activate
    (venv)$ pip install pip-tools
    (venv)$ make requirements
    (venv)$ pip install -r requirements/dev.txt
    (venv)$ py.test -v tests/

----

Beispielprojekt neue Funktionen implementieren
----------------------------------------------

Sourcen patchen::

    cd pep-pager
    patch -p1 -i ../pep-pager.diff

Test::

    (venv)$ make requirements
    (venv)$ pip-sync requirements/dev.txt

----

Requirements Dateien
--------------------

Üblicherweise::

    $ mkvirtualenv foo
    $ pip install dies das und jenes
    $ pip freeze > requirements.txt

----

Bad
---

::

    --find-links http://foo.com/pypi
    # development
    -r requirements-dev.txt

    # production
    foo
    bar==1.0
    broken<=1.9
    newandshiny >= 3.0
    bigpackage [frob]
    bloated==10.1 [gargle,fizzle]
    -e git+http://git.projects.org/MyProject/#egg=AProject
    -e git+http://git.projects.org/OtherProject/#egg=OtherProject==2.7

----

Good
----

``requiremnts/base.txt``::

    foo==1.0
    bar==1.1
    broken==1.9
    newandshiny==3.0.2
    bigpackage==10.0.3 [frob]
    bloated==10.1 [gargle,fizzle]
    AProject==1.0.1
    OtherProject==2.7

``requirements/dev.txt``::

    -r base.txt
    Sphinx==1.5.1

----

Better
------

``requirements/base.in``::

    foo
    newandshiny>=3.0
    bloated[gargle,fizzle]
    AProject
    OtherProject

``requirements/dev.in``::

    -r base.txt
    Sphinx>=1.5

----

Weiterführende Links
====================

-----

Artikel & Howtos
----------------

* `Packaging and Distributing Projects
  <https://packaging.python.org/distributing/>`_
* `A non-magical introduction to Pip and Virtualenv for Python beginners
  <https://www.dabapps.com/blog/introduction-to-pip-and-virtualenv-python/>`_
* `A successful pip-tools workflow for managing Python package requirements
  <http://jamescooke.info/a-successful-pip-tools-workflow-for-managing-python-package-requirements.html>`_
* `A Better Pip Workflow <https://www.kennethreitz.org/essays/a-better-pip-workflow>`_

----

Tools
-----

* pip-tools_: https://github.com/jazzband/pip-tools
* pipreqs_: https://github.com/bndr/pipreqs
* devpi_: http://doc.devpi.net/
* pmm: https://github.com/Pana/nrm.git

.. _devpi: https://pypi.python.org/pypi/devpi
.. _pip-tools: https://pypi.python.org/pypi/pip-tools
.. _pipreqs: https://pypi.python.org/pypi/pipreqs
.. _tox: https://tox.readthedocs.org/
.. _pip: https://pypi.python.org/pypi/pip
.. _virtualenv: https://pypi.python.org/pypi/virtualenv
.. _cookiecutter: https://pypi.python.org/pypi/cookiecutter

----

Weitere Tools
-------------

* `Python Packaging Tools <Python-Packaging-Tools.pdf>`_
* `Python Quality Assurance Tools <Python-Quality-Assurance-Tools.pdf>`_

----

Danke für die Aufmerksamkeit!
=============================

----

Folien & Beispiele
------------------

* http://github.com/SpotlightKid/talk-requirements-revisited


----

Python-Programmierung & Open Source/Linux-Beratung
--------------------------------------------------

* http://chrisarndt.de/
* chris@chrisarndt.de
* +49 (0)176-28259175
