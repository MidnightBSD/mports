# $MidnightBSD: mports/misc/metalink-tools/Makefile,v 1.4 2013/02/18 02:16:12 laffer1 Exp $

PORTNAME=	metalink
PORTVERSION=	0.3.6
PORTREVISION=	3
CATEGORIES=	misc
MASTER_SITES=	SF/metalinks/Metalink%20commandline/${PORTVERSION}
PKGNAMESUFFIX?=	-tools

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Metalink generation tool

LICENSE=	gpl3

LIB_DEPENDS=	gcrypt:${PORTSDIR}/security/libgcrypt \
		glibmm-2.4.1:${PORTSDIR}/devel/glibmm \
		gpg-error.0:${PORTSDIR}/security/libgpg-error \
		sigc-2.0.0:${PORTSDIR}/devel/libsigc++20

USE_GNOME=	glib20
USES=		pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	AWK="${AWK}"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

# Documents to install
DOC_FILES=	\
		README

.ifndef(NOPORTDOCS)
PORTDOCS=	*
.endif

PLIST_FILES=	bin/${PORTNAME}

do-install:
# docs
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
