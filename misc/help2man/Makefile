PORTNAME=	help2man
PORTVERSION=	1.49.3
CATEGORIES=	misc
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically generating simple manual pages from program output
WWW=		https://www.gnu.org/software/help2man/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake localbase perl5 tar:xz

BUILD_DEPENDS+=	indexinfo:print/indexinfo

GNU_CONFIGURE=	yes

INFO=		help2man
PLIST_FILES=	bin/help2man \
		share/man/man1/help2man.1.gz

OPTIONS_DEFINE=	NLS

NLS_BUILD_DEPENDS=	p5-Locale-gettext>=0:devel/p5-Locale-gettext
NLS_CONFIGURE_ENABLE=	nls
NLS_PLIST_FILES=	lib/help2man/bindtextdomain.so
NLS_RUN_DEPENDS=	p5-Locale-gettext>=0:devel/p5-Locale-gettext
NLS_USES=		gettext
NLS_VARS=		CONFIGURE_FAIL_MESSAGE="Rebuild lang/${PERL_PORT} and devel/p5-Locale-gettext manually before contacting maintainer."
NLS_VARS_OFF=		NO_ARCH=yes

.for lang in de es fr pl pt_BR ro sr sv uk zh_CN
NLS_INFO+=		help2man-${lang}
.endfor

.for lang in da de el eo es fi fr hr hu it ja ko nb pl pt_BR ro ru sr sv ta uk vi zh_CN
NLS_PLIST_FILES+=	share/man/${lang}/man1/help2man.1.gz \
			share/locale/${lang}/LC_MESSAGES/help2man.mo
.endfor

.include <bsd.port.mk>
