PORTNAME=	slrn
PORTVERSION=	1.0.3a
PORTREVISION=	2
CATEGORIES=	news
MASTER_SITES=	http://www.jedsoft.org/releases/slrn/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SLang-based newsreader
WWW=		https://slrn.sourceforge.net/

LICENSE=	gpl2+

LIB_DEPENDS=	libslang.so:devel/libslang2

CONFLICTS_INSTALL=	ja-slrn

USES=		gmake iconv tar:bz2

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS+=--disable-inews --with-slrnpull \
		${ICONV_CONFIGURE_ARG}

ALL_TARGET=	all
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:C/[a-z]$//}

MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=	NLS SSL DEVIEW DOCS
OPTIONS_DEFAULT=SSL
OPTIONS_SUB=	yes
NLS_USES=		gettext
NLS_CONFIGURE_OFF=	--disable-nls
SSL_USES=		ssl
SSL_CONFIGURE_WITH=	ssl
DEVIEW_DESC?=		UUdecode view support
DEVIEW_LIB_DEPENDS=	libuu.so:converters/uulib
DEVIEW_CONFIGURE_WITH=	uulib
DOCS_CONFIGURE_OFF=	--with-docdir=${WRKSRC}/dummy

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/lib/sendmail,/usr/sbin/sendmail,' \
		${WRKSRC}/src/slrnfeat.hin

.include <bsd.port.mk>
