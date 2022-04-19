PORTNAME=	ansible-base
DISTVERSION=	2.10.17
CATEGORIES=	sysutils python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PATCH_SITES=	https://github.com/ansible/ansible/commit/
PATCHFILES=	6459fbb7bcf792aac9208d7851bf1edeb0495295.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Radically simple IT automation

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>0:security/py-cryptography@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}resolvelib05>0:devel/py-resolvelib05@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}yaml>0:devel/py-yaml@${PY_FLAVOR}

USES=		ansible:env cpe gmake python:3.6+ shebangfix
CPE_VENDOR=	redhat
CPE_PRODUCT=	ansible
USE_PYTHON=	autoplist concurrent distutils

SHEBANG_REGEX=	[.]/test/.*[.]py

NO_TEST=	yes
CONFLICTS=	py*-ansible-core

NO_ARCH=	yes

PLIST_FILES=	share/man/man1/ansible-config.1.gz \
		share/man/man1/ansible-console.1.gz \
		share/man/man1/ansible-doc.1.gz \
		share/man/man1/ansible-galaxy.1.gz \
		share/man/man1/ansible-inventory.1.gz \
		share/man/man1/ansible-playbook.1.gz \
		share/man/man1/ansible-pull.1.gz \
		share/man/man1/ansible-vault.1.gz \
		share/man/man1/ansible.1.gz
PORTEXAMPLES=	ansible.cfg hosts

OPTIONS_DEFINE=	DOCS EXAMPLES

post-patch:
# Preserve the original paths in
# test/units/cli/galaxy/test_execute_list_collection.py.
# Replacing /usr/share/ansible breaks tests.
	${FIND} ${WRKSRC} -not -regex '${WRKSRC}/test/units/cli/galaxy/test_execute_list_collection.py' -type f -print0 | \
		${XARGS} -0 ${REINPLACE_CMD} \
			-e 's|/etc/ansible|${ETCDIR}|g' \
			-e 's|/usr/share/ansible|${DATADIR}|g'
	${FIND} ${WRKSRC} -type f -name "*.bak" -delete

post-install:
	@${MKDIR} ${MAN1PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/docs/man/man1/*.1 \
		${MAN1PREFIX}/share/man/man1

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/ansible.cfg ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/hosts ${FAKE_DESTDIR}${EXAMPLESDIR}

post-fake:
	${FIND} ${STAGEDIR}${PREFIX}/bin -type l -name ansible-\* -lname ansible \
		-execdir ${RLN} ansible-${PYTHON_VER} {} \;
# USE_PYTHON=autoplist doesn't add this file to pkg-plist.
	-${RM} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/ansible_test/_data/injector/ansible-inventory

.include <bsd.port.mk>

# Make sure that we override the unique DATADIR and ETCDIR set
# by the implicit USES=uniquefiles.
DATADIR=	${ANSIBLE_DATADIR}
ETCDIR=		${ANSIBLE_ETCDIR}
