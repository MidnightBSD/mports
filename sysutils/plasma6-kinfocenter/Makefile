PORTNAME=	kinfocenter
DISTVERSION=	${KDE_PLASMA_VERSION}
CATEGORIES=	sysutils kde kde-plasma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	View information about your computer's hardware

BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
RUN_DEPENDS=	clinfo:devel/clinfo \
		glxinfo:graphics/mesa-demos \
		hwdata>0:misc/hwdata \
		lsblk:sysutils/lsblk \
		lscpu:sysutils/lscpu \
		pipewire:multimedia/pipewire \
		vulkaninfo:graphics/vulkan-tools \
		wayland-info:graphics/wayland-utils \
		xdpyinfo:x11/xdpyinfo

USES=		cmake desktop-file-utils gettext gl kde:6 pkgconfig qt:6 tar:xz
USE_GL=		gl opengl
USE_KDE=	auth colorscheme completion config configwidgets coreaddons \
		doctools i18n jobwidgets kcmutils kio package service solid \
		widgetsaddons \
		ecm:build \
		kirigami2:run systemsettings:run
USE_QT=		base declarative

.include <bsd.mport.options.mk>

.if ${ARCH} == aarch64 || ${ARCH} == amd64 || ${ARCH} == i386
RUN_DEPENDS+=	dmidecode:sysutils/dmidecode
.endif

post-patch:
	 ${REINPLACE_CMD} '/usb.ids/s,/usr,${LOCALBASE},' ${WRKSRC}/kcms/usbview/usbdb.cpp

# install freebsd-logo and distrorc
post-install:
	${MKDIR} /${DATADIR}/images
	${INSTALL_DATA} ${FILESDIR}/freebsd_logo.svg /${DATADIR}/images/
	${MKDIR} /${PREFIX}/etc/xdg
	${INSTALL_DATA} ${FILESDIR}/kcm-about-distrorc /${PREFIX}/etc/xdg/
	${REINPLACE_CMD} -i "" -e "s#%%DATADIR%%#${DATADIR}#" /${PREFIX}/etc/xdg/kcm-about-distrorc

.include <bsd.port.mk>
