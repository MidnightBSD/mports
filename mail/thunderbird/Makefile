PORTNAME=	thunderbird
PORTVERSION=	60.2.1
CATEGORIES=	www
MASTER_SITES=	https://pkg.freebsd.org/FreeBSD:10:amd64/latest/All/
DISTFILES=	thunderbird-60.2.1_3.txz \
		hunspell-1.6.2_1.txz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird for FreeBSD

LICENSE=	mpl gpl2
LICENSE_COMB=	dual

LIB_DEPENDS+=	libicui18n.so:devel/icu \
		libvpx.so:multimedia/libvpx

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

.include <bsd.port.mk>
