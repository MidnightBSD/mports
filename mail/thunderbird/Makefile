PORTNAME=	thunderbird
PORTVERSION=	78.8.0
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://www.midnightbsd.org/ftp/MidnightBSD/mports/distfiles/ \
		https://pkg.freebsd.org/FreeBSD:11:amd64/quarterly/All/
DISTFILES=	thunderbird-78.8.0.txz hunspell-1.7.0_2.txz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird for FreeBSD
WWW=		https://www.mozilla.com/thunderbird/

LICENSE=	MPL20 gpl2
LICENSE_COMB=	dual

LIB_DEPENDS+=	libicui18n.so:devel/icu \
		libvpx.so:multimedia/libvpx \
		libjson-c.so:devel/json-c \
		libbotan-2.so:security/botan2

USES=	gnome tar:xz
USE_GNOME=	gtk20

ONLY_FOR_ARCHS=	amd64

NO_BUILD=	yes

do-extract:
	${MKDIR} ${FAKE_DESTDIR}/usr/local
.for d in ${DISTFILES}
	cd ${FAKE_DESTDIR} && tar -xzf ${DISTDIR}/${d}
.endfor

do-install:
	${NOOP}

post-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/man/man1
	${CP} ${FAKE_DESTDIR}${PREFIX}/man/man1/* ${FAKE_DESTDIR}${PREFIX}/share/man/man1
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/man/man3
	${CP} ${FAKE_DESTDIR}${PREFIX}/man/man3/* ${FAKE_DESTDIR}${PREFIX}/share/man/man3

.include <bsd.port.mk>
