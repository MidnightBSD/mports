PORTNAME=	ansible-core
DISTVERSION=	2.18.7
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${PORTNAME:R:S/-/_/}-${DISTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Radically simple IT automation
WWW=		https://www.ansible.com/

WRKSRC=		${WRKDIR}/${PORTNAME:R:S/-/_/}-${DISTVERSION}

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Jinja2>=3.0.0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}resolvelib>=0.5.3<1.1.0:devel/py-resolvelib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}toml>0:textproc/py-toml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}passlib>0:security/py-passlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=5.1:devel/py-pyyaml@${PY_FLAVOR}

USES=		ansible:env cpe python shebangfix
CPE_VENDOR=	redhat
CPE_PRODUCT=	ansible
USE_PYTHON=	autoplist concurrent cryptography pep517

SHEBANG_REGEX=	[.]/test/.*[.]py

# Pass MAKE_ENV to TEST_ENV so that binary aliases via an updated PATH.
TEST_ENV=	${MAKE_ENV}

# The "python" binary alias is needed for the tests.
BINARY_ALIAS=	python=${PYTHON_CMD}
NO_ARCH=	yes
NO_TEST=	yes

post-patch:
# Preserve the original paths in
# test/units/cli/galaxy/test_execute_list_collection.py.
# Replacing /usr/share/ansible breaks tests.
	${FIND} ${WRKSRC} -not -regex '${WRKSRC}/test/units/cli/galaxy/test_execute_list_collection.py' -type f -print0 | \
		${XARGS} -0 ${REINPLACE_CMD} \
			-e 's|/etc/ansible|${ETCDIR}|g' \
			-e 's|/usr/share/ansible|${DATADIR}|g'
	${FIND} ${WRKSRC} -type f -name "*.bak" -delete

post-fake:
	${FIND} ${FAKE_DESTDIR}${PREFIX}/bin -type l -name ansible-\* -lname ansible \
		-execdir ${RLN} ansible-${PYTHON_VER} {} \;
# USE_PYTHON=autoplist doesn't add this file to pkg-plist.
	${RM} ${STAGEDIR}${PYTHONPREFIX_SITELIBDIR}/ansible_test/_data/injector/ansible-inventory

.include <bsd.port.mk>

# Make sure that we override the unique DATADIR and ETCDIR set
# by the implicit USES=uniquefiles.
DATADIR=	${ANSIBLE_DATADIR}
ETCDIR=		${ANSIBLE_ETCDIR}
