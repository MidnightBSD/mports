PORTNAME=	gindent
DISTVERSION=	2.2.12
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	GNU/indent
DISTNAME=	indent-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C source code reformatter
WWW=		https://www.gnu.org/software/indent/indent.html

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=	groff:both localbase:ldflags makeinfo

INFO=	indent

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g --htmldir=${DOCSDIR}

CPPFLAGS+=	-DBERKELEY_DEFAULTS=1

OPTIONS_DEFINE=		DOCS NLS
OPTIONS_SUB=		yes
NLS_DESC=		Native Language Support via gettext utilities
NLS_USES=		gettext
NLS_CONFIGURE_OFF=	--disable-nls

post-patch:
	@${GREP} -lR "malloc\.h" ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -e \
		's|malloc\.h|stdlib.h|g'

.include <bsd.port.mk>
