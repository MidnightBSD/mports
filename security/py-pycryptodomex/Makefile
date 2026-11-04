PORTNAME=	pycryptodomex

CONFLICTS_INSTALL=

MASTERDIR=	${.CURDIR}/../py-pycryptodome
DISTINFO_FILE=	${.CURDIR}/distinfo

NAMESPACE=	Cryptodome

pre-build:
	@${TOUCH} ${WRKSRC}/.separate_namespace

.include "${MASTERDIR}/Makefile"
