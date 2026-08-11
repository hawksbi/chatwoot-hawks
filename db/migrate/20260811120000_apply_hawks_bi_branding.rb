class ApplyHawksBiBranding < ActiveRecord::Migration[7.1]
  BRANDING = {
    'INSTALLATION_NAME' => 'HAWKS BI',
    'LOGO_THUMBNAIL' => '/brand-assets/hawks-bi-mark.svg',
    'LOGO' => '/brand-assets/hawks-bi-wordmark.svg',
    'LOGO_DARK' => '/brand-assets/hawks-bi-wordmark-reverse.svg',
    'BRAND_URL' => 'https://hawksbi.com.br',
    'WIDGET_BRAND_URL' => 'https://hawksbi.com.br',
    'BRAND_NAME' => 'HAWKS BI',
    'DISPLAY_MANIFEST' => false,
  }.freeze

  def up
    BRANDING.each do |name, value|
      config = InstallationConfig.find_or_initialize_by(name: name)
      config.value = value
      config.save!
    end

    GlobalConfig.clear_cache
  end

  def down
    # Branding is intentionally one-way for the isolated HAWKS BI deployment.
  end
end
