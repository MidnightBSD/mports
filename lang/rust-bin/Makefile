PORTNAME=	rust-bin
PORTVERSION=	1.30.0
CATEGORIES=	lang
MASTER_SITES=	http://www.midnightbsd.org/ftp/MidnightBSD/distfiles/rust/${ARCH}/ \
		http://pkg.freebsd.org/${FBSD_PATH}/latest/All/
DISTFILES=      rust-1.30.0.txz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=        Language with a focus on memory safety and concurrency (FreeBSD version)

LICENSE=        apache2 mit
LICENSE_COMB=   dual

USES=		pkgconfig python:3.3+,build ssl tar:xz
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

DISTINFO_FILE=	${MASTERDIR}/distinfo.${ARCH}

LIB_DEPENDS=    libcurl.so:ftp/curl \
                libgit2.so:devel/libgit2 \
                libssh2.so:security/libssh2

PLIST=          ${PKGDIR}/pkg-plist

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
FBSD_PATH=	FreeBSD:10:amd64
.else
FBSD_PATH=      FreeBSD:10:i386
.endif

do-install:
	${MKDIR} ${FAKE_DESTDIR}
	${CP} -R ${WRKDIR}/usr ${FAKE_DESTDIR}/
	@${FIND} ${PREFIX} -not -type d | \
                ${SED} -E -e 's,^${PREFIX}/,,' \
                        -e 's,(share/man/man[1-9]/.*\.[0-9]),\1.gz,' >> ${TMPPLIST}

.include <bsd.port.post.mk>
