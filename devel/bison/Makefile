PORTNAME=	bison
PORTVERSION=	3.8.2
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parser generator from FSF, (mostly) compatible with Yacc
WWW=		https://savannah.gnu.org/projects/bison/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	m4>=1.4.16,1:devel/m4

USES=		charsetfix compiler:c11 cpe gmake iconv localbase perl5 tar:xz
USE_PERL5=	build

CONFIGURE_ARGS=	--disable-yacc --enable-relocatable
CONFIGURE_ENV=	gl_cv_lib_readline=no
GNU_CONFIGURE=	yes
LIBS+=		-lm
NO_TEST=	yes

INFO=		bison

CPE_VENDOR=	gnu

OPTIONS_DEFINE=	DOCS EXAMPLES NLS
OPTIONS_SUB=	yes

NLS_BUILD_DEPENDS=	libtextstyle>=0.21:devel/libtextstyle
NLS_CONFIGURE_ENABLE=	nls
NLS_CONFIGURE_OFF=	ac_cv_libtextstyle=no
NLS_LIB_DEPENDS=	libtextstyle.so:devel/libtextstyle
NLS_USES=		gettext

.include <bsd.port.mk>
