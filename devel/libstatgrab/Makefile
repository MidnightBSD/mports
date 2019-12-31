# Created by: Tim Bishop <tim@bishnet.net>

PORTNAME=	libstatgrab
PORTVERSION=	0.92
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libstatgrab/libstatgrab/releases/download/LIBSTATGRAB_${PORTVERSION:S/./_/}/ \
		http://ftp.mirrorservice.org/pub/i-scream/libstatgrab/ \
		http://ftp.i-scream.org/pub/i-scream/libstatgrab/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides a useful interface to system statistics

LICENSE=	lgpl2.1

USES=		pathfix pkgconfig libtool
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--docdir=${DOCSDIR}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

OPTIONS_DEFINE=	TOOLS DOCS
OPTIONS_DEFAULT=	TOOLS

TOOLS_DESC=	Build and install statgrab and saidar
TOOLS_CONFIGURE_ENABLE=	statgrab saidar
TOOLS_USES=	shebangfix perl5 ncurses
TOOLS_VARS=	SHEBANG_FILES+="src/statgrab/statgrab-make-mrtg-config.in \
				src/statgrab/statgrab-make-mrtg-index.in" \
		LICENSE+=gpl2 LICENSE_COMB=multi

OPTIONS_SUB=	yes

.include <bsd.port.mk>
