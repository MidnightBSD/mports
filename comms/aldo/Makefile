PORTNAME=	aldo
PORTVERSION=	0.7.7
PORTREVISION=	1
CATEGORIES=	comms hamradio
MASTER_SITES=	SAVANNAH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Morse code training program

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libao.so:audio/libao

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--includedir="${LOCALBASE}/include" \
		--libdir="${LOCALBASE}/lib"
USES=		compiler:c++0x gmake libtool tar:bzip2
USE_GCC=	7

PLIST_FILES=	bin/aldo \
		man/man1/aldo.1.gz

AUTOTOOLSFILES=	aclocal.m4

post-patch:
	@${REINPLACE_CMD} -e 's|1.10|%%AUTOMAKE_APIVER%%|g' \
			  -e 's|2.61|%%AUTOCONF_VERSION%%|g' \
			  ${WRKSRC}/aclocal.m4

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/aldo ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/aldo.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
