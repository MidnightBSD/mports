PORTNAME=	eblook
PORTVERSION=	1.6.1
PORTREVISION=	10
CATEGORIES=	japanese textproc
MASTER_SITES=	http://openlab.ring.gr.jp/edict/eblook/dist/
DIST_SUBDIR=	eb

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command to lookup words in EB format dictionaries
WWW=		http://openlab.ring.gr.jp/edict/eblook/index.html.ja

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libeb.so:japanese/eb

USES=		iconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-eb-conf=${PREFIX}/etc/eb.conf
CPPFLAGS+=	-I${ICONV_PREFIX}/include
LIBS+=		-L${ICONV_PREFIX}/lib ${ICONV_LIB}

INFO=		eblook
PLIST_FILES=	bin/eblook
PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if !empty(ICONV_LIB)
CONFIGURE_ARGS+=ac_cv_func_iconv=yes
.endif

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
