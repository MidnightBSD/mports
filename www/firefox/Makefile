PORTNAME=	firefox
PORTVERSION=	63.0
CATEGORIES=	www
MASTER_SITES=	https://pkg.freebsd.org/FreeBSD:10:amd64/latest/All/
DISTFILES=	firefox-63.0_3,1.txz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Firefox for FreeBSD

LICENSE=	mpl gpl2
LICENSE_COMB=	dual

LIB_DEPENDS+=	libicui18n.so:devel/icu \
		libvpx.so:multimedia/libvpx

USES=	tar:xz

ONLY_FOR_ARCHS=	amd64

NO_BUILD=	yes

do-extract:
	${MKDIR} ${FAKE_DESTDIR}/usr/local
	cd ${FAKE_DESTDIR} && tar -xzf ${DISTDIR}/${DISTFILES}

do-install:
	${NOOP}

.include <bsd.port.mk>
