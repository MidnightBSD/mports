PORTNAME=	Curses
PORTVERSION=	1.41
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for terminal screen handling and optimization
WWW=		https://metacpan.org/release/Curses

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE_artistic=	${WRKSRC}/Artistic
LICENSE_FILE_gpl=	${WRKSRC}/Copying

USES=		perl5
USE_PERL5=	configure

CONFIGURE_ARGS=	PANELS MENUS FORMS
CONFIGURE_ENV=	CURSES_CFLAGS="-I${WRKSRC}/usr/include/ncurses"

OPTIONS_DEFINE=	NCURSESW
NCURSESW_DESC=	Wide-character-capable support by ncursesw library
NCURSESW_CONFIGURE_ENV=		CURSES_LDFLAGS="-L/usr/lib/ -lncursesw" \
				CURSES_LIBTYPE="ncursesw"
NCURSESW_CONFIGURE_ENV_OFF=	CURSES_LDFLAGS="-L/usr/lib/ -lncurses"

pre-configure:
	@${LN} -fs ${WRKSRC}/hints/c-freebsd.ncurses.h ${WRKSRC}/c-config.h
	@${MKDIR} ${WRKSRC}/usr/include/ncurses
.for i in form.h ncurses.h menu.h panel.h
	@${LN} -fs /usr/include/${i} ${WRKSRC}/usr/include/ncurses/${i}
.endfor

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Curses/Curses.so

.include <bsd.port.mk>
