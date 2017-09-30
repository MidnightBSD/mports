# $MidnightBSD$

PORTNAME=	slrn
PORTVERSION=	1.0.3a
CATEGORIES=	news ipv6
MASTER_SITES=	http://www.jedsoft.org/releases/slrn/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SLang-based newsreader

LICENSE=	gpl2

LIB_DEPENDS=	libslang.so:devel/libslang2

CONFLICTS_INSTALL=	ja-slrn-[0-9]*

USES=		gmake iconv tar:bzip2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-inews --with-slrnpull \
		--with-non-gnu-iconv ${ICONV_CONFIGURE_ARG} \
		--enable-ssl

ALL_TARGET=	all
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:C/[a-z]$//}

MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=	NLS DEVIEW DOCS
OPTIONS_SUB=	yes
NLS_USES=		gettext
NLS_CONFIGURE_OFF=	--disable-nls
DEVIEW_DESC?=		UUdecode view support
DEVIEW_LIB_DEPENDS=	libuu.so:converters/uulib
DEVIEW_CONFIGURE_WITH=	uulib
DOCS_CONFIGURE_OFF=	--with-docdir=${WRKSRC}/dummy

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/lib/sendmail,/usr/sbin/sendmail,' \
		${WRKSRC}/src/slrnfeat.hin

.include <bsd.port.mk>
