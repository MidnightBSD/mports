DISTVERSION=	1.23.12
# Always set PORTREVISION explicitly as otherwise they are inherited from lang/go-devel
MASTER_SITES=	https://golang.org/dl/ \
		https://github.com/dmgk/go-bootstrap/releases/download/${BOOTSTRAP_TAG}/:bootstrap \
		FREEBSD_LOCAL/dmgk:bootstrap
DISTFILES=	go${DISTVERSION}.src.tar.gz \
		go-freebsd-${GOARCH_${ARCH}}${GOARM_${ARCH}}-${BOOTSTRAP_TAG}.tar.xz:bootstrap

# Avoid conflicting patch files
PATCHFILES=
PATCHDIR=	${.CURDIR}/files

COMMENT=	Go programming language

MASTERDIR=	${.CURDIR}/../go-devel
WRKSRC=		${WRKDIR}/go
DISTINFO_FILE=	${.CURDIR}/distinfo

.include "${MASTERDIR}/Makefile"
